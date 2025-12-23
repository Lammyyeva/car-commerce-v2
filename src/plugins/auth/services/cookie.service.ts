import { Injectable } from "@nestjs/common";
import { Response } from 'express';

@Injectable()
export class CookieService {
    attachTokenToCookie(res: Response, key: string, token: string, expiresInHour: string) {
        const expires = Number(expiresInHour) * 1000 * 60 * 60;

        res.cookie(key, token, {
            httpOnly: true,
            maxAge: expires,
            signed: true// change to true
        })
    }

    removeCookies(res: Response, key: string) {
        res.clearCookie(key)
    }
}