
import { request, response } from 'express';
import jwt from 'jsonwebtoken';

export const verifyToken = (_req = request, _res = response, _next) => {

    if (!_req.headers.authorization) {

        return _res.status(401).json({
            success: false,
            msg: 'Authorization | Unauthorization request'
        });

    }

    const token = _req.headers.authorization.split(' ')[1];

    if (token === 'null') {
        return _res.status(401).json({
            success: false,
            msg: 'Authorization | Unauthorization request'
        });
    }

    const payload = jwt.verify(token, process.env.JWTKEY);

    _req.userID = payload;

    _next();

}