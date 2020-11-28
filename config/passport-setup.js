const passport = require("passport");
const GoogleStrategy = require("passport-google-oauth").OAuth2Strategy;
const key = require("./key");

passport.serializeUser((USER, done) => {
    done(null, USER);
});

passport.deserializeUser((id, done) => {
    // TODO: generally, you must query for id in DB

    done(null, id);
});

passport.use(
    new GoogleStrategy(
        {   clientID: key.google.client,
            clientSecret: key.google.secret,
            callbackURL: "/auth/google/redirect"},
        (accessToken, refreshToken, profile, done) => {
           
            const USER = {name: profile.displayName, email:profile.emails[0].value, photo:profile.photos[0].value}
           
            //serialize user info
            done(null, USER);
        }
        )
);

