import { Injectable } from "@nestjs/common";
import { JwtService as jwtService } from "@nestjs/jwt";
import { User } from "@vendure/core";
import { UserResponse } from "../types";

const refreshTokenTime = Number(process.env.REFRESH_TOKEN_TIME) || 3 * 60;
const accessTokenTime = Number(process.env.ACCESS_TOKEN_TIME) || 1 * 60;
const secret = process.env.SECRET_KEY;

@Injectable()
export class CustomJwtService {
    constructor(private jwtService: jwtService) { }

    generateTokens(payload: UserResponse) {
        console.log('hello jwt: ', payload);
        
        const accessToken = this.jwtService.sign(payload, { secret, expiresIn: accessTokenTime });
        const refreshToken = this.jwtService.sign(payload, { secret, expiresIn: refreshTokenTime });
        return {
            accessToken,
            refreshToken
        }
    }

    verifyToken(token: string) {
        return this.jwtService.verify(token, { secret })
    }

    decodeToken(token: string){
        const { iat, exp, ...rest } = this.jwtService.decode(token);

        return rest;
    }
}