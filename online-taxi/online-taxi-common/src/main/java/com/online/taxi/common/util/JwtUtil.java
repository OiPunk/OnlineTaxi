package com.online.taxi.common.util;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Jwts;

import java.util.Date;

/**
 * @author oi
 */
public class JwtUtil {
    /**
     * Secret key, stored only on the server side.
     * IMPORTANT: Override via environment variable JWT_SECRET in production.
     */
    private static String secret = System.getenv("JWT_SECRET") != null
            ? System.getenv("JWT_SECRET") : "changeme-override-in-production";

    /**
     * Create a JWT token.
     *
     * @param subject   the subject claim
     * @param issueDate the token issue date
     * @return the signed JWT token string
     */
    public static String createToken(String subject, Date issueDate) {
        String compactJws = Jwts.builder()
                .setSubject(subject)
                .setIssuedAt(issueDate)
                .setExpiration(new Date( System.currentTimeMillis() + 1000 * 60 * 60 * 24 * 30 ))
                .signWith(io.jsonwebtoken.SignatureAlgorithm.HS512, secret)
                .compact();
        return compactJws;

    }

    /**
     * Parse and validate a JWT token.
     *
     * @param token the JWT token to parse
     * @return the subject claim, or empty string if invalid/expired
     */
    public static String parseToken(String token) {
        try {
            Claims claims = Jwts.parser().setSigningKey(secret).parseClaimsJws(token).getBody();
            if (claims != null){
                return claims.getSubject();
            }
        }catch (ExpiredJwtException e){
            e.printStackTrace();
            System.out.println("JWT token has expired");
        }

        return "";
    }

    public static void main(String[] args) {
        String subject = "1";
        String token = createToken(subject,new Date());
        System.out.println(token);
        try {
			Thread.sleep(10010);
//        	Thread.sleep(100);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
        System.out.println("Original value: "+parseToken(token));

    }

}
