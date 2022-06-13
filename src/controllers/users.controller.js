import { request, response } from "express";
import { sql, getConnection, queries } from '../database';
import jwt from 'jsonwebtoken';

// SIGN IN USER
export const signInCustomer = async (_req = request, _res = response) => {
    try {

        const { UserName, Pass_Word } = _req.body;

        // Validating
        if (UserName == null || Pass_Word == null) {
            return _res.status(400).json({
                success: false,
                msg: 'Bad Request | Please fill all fields to sign in'
            });
        };

        const pool = await getConnection();
        const result = await pool.request()
            .input('UserName', sql.VarChar, UserName)
            .input('Pass_Word', sql.VarChar, Pass_Word)
            .query(queries.validateUser);

        const user = result.recordset[0];

        if (result.rowsAffected[0] == 0) {

            return _res.status(400).json({
                success: false,
                msg: 'Wrong credentials | Please verify and try again'
            });

        }

        const token = jwt.sign(user.Id_User, process.env.JWTKEY);


        _res.json({
            success: true,
            status: 200,
            token: token
        });


    } catch (_err) {
        _res.json({
            success: false,
            msg: 'Error validating user',
            error: _err
        });
    };
};
