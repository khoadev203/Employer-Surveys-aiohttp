import os
import re
from os.path import abspath, dirname
from common import log

BASE_PATH = dirname(abspath(__file__))


def to_bool(astr):
    return bool(astr.strip().lower() in ('true', '1')) if isinstance(astr, str) else bool(int(astr))


async def register_globals(app):
    app['referer_regex'] = re.compile("^[a-zA-Z0-9/_]+$")
    return app


env_params = {
    'SITE_USE_MULTITHREAD': to_bool,
    'SITE_HOST': str,
    'PORT': int,
    'SITE_NAME': str,
    'SITE_DEBUG_TOOLBAR': to_bool,
    'SITE_UVLOOP': to_bool,
    'SITE_UPLOAD_DIR': str,
    'SITE_GEO_PATH': str,
    'SITE_COOKIE_NAME': str,
    'SITE_LOG_LEVEL': str,
    'SITE_SSL': to_bool,
    'EMAIL_SENDGRID_KEY': str,
    'EMAIL_DEFAULT_SENDER': str,
    'SMS_TWILIO_ACCOUNT_SID': str,
    'SMS_TWILIO_AUTH_TOKEN': str,
    'SMS_TWILIO_NUMBER': str,
    'MYSQL_HOSTNAME': str,
    'MYSQL_PORT': int,
    'MYSQL_DATABASE': str,
    'MYSQL_USERNAME': str,
    'MYSQL_PASSWORD': str,
    'REDIS_URL': str,
    'REDIS_HOST': str,
    'REDIS_PORT': int,
    'BAUTH_ENABLED': to_bool,
    'BAUTH_USERNAME': str,
    'BAUTH_PASSWORD': str,
    'CSRF_FORM_FIELD': str,
    'CSRF_SESSION_NAME': str,
    'CSRF_SECRET': str,
    'JWT_SECRET': str,
    'ARANGO_HOST': str,
    'ARANGO_PORT': int,
    'ARANGO_USER': str,
    'ARANGO_PASSWORD': str,
    'ARANGO_DB': str,
    'ARANGO_GRAPH_ROOT': str,
    'ARANGO_GRAPH_NAME': str,
    'SITE_DOMAIN': str,
    'IN_PRODUCTION': to_bool,
    'ALLOW_DUPE_NOTIFY': to_bool,
    'DUPE_BLOCK_MINS': int
}

environment_vars = os.environ
ENV = {}
for env_key, type_setter in env_params.items():
    try:
        if from_env := environment_vars.get(env_key):
            try:
                ENV[env_key] = type_setter(from_env)
            except ValueError as ex:
                log.warning("Env var 'value' error, unable to set:", env_key)
                continue
    except KeyError:
        log.warning("Env var 'key' error, unable to set:", env_key)
        continue
if len(ENV) == 0:
    ENV = {
        'SITE_USE_MULTITHREAD': False,
        'SITE_HOST': "0.0.0.0",
        'PORT': 8080,
        'SITE_NAME': "Employer Surveys",
        'SITE_DEBUG_TOOLBAR': False,
        'SITE_UVLOOP': False,
        'SITE_GEO_PATH': "data/GeoLite2-City.mmdb",
        'SITE_COOKIE_NAME': "esurvey",
        'SITE_LOG_LEVEL': "DEBUG",
        'EMAIL_SENDGRID_KEY': "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",
        'EMAIL_DEFAULT_SENDER': "site@em4055.survey.surf",
        'SMS_TWILIO_ACCOUNT_SID': "EV[1:Q+QL+0t82xUN55VnOJTZQhYmnKOjvYV2:VazQum/ZFqQxpcoEbVic4ZepGsxliKuw2Y48tKGkG7wCwLw0muz/6uVtGrCXTLJGiaM=]",
        'SMS_TWILIO_AUTH_TOKEN': "EV[1:7m9BvPag99El1BB4hUbkHbT5HIJwOeld:ongCcl8av2mSQOA+BSb/82cw0dzubxPbcRalieMwTpTQPuweXe1YAr+vDsmRyKUM]",
        'SMS_TWILIO_NUMBER': "+19549325677",
        # 'MYSQL_HOSTNAME': "db-mysql-nyc3-01654-do-user-9432786-0.b.db.ondigitalocean.com",
        # 'MYSQL_PORT': 25060,
        # 'MYSQL_DATABASE': "defaultdb",
        # 'MYSQL_USERNAME': "doadmin",
        # 'MYSQL_PASSWORD': "rt25hd8spmof4v7h",
        'MYSQL_HOSTNAME': "127.0.0.1",
        'MYSQL_PORT': 3306,
        'MYSQL_DATABASE': "survey",
        'MYSQL_USERNAME': "newuser",
        'MYSQL_PASSWORD': "password",
        'REDIS_URL': "rediss://default:cjee6j7redseg6d8@db-redis-nyc3-89317-do-user-9432786-0.b.db.ondigitalocean.com:25061",
        'CSRF_FORM_FIELD': "csrf",
        'CSRF_SESSION_NAME': "csrf",
        'CSRF_SECRET': "EV[1:1vI7pRjcdF2rZ0afzEFw/qiCtQEY1aL4:oeglt1Elfi2oaSzTxhYR7ZjlJz36nW/Tqm1w4Meaj8BGS/A2r7qaUriLYu0Sdg==]",
        'JWT_SECRET': "EV[1:VVXFtTndSK0hRs47i920km+Onky9cp5Q:0K/kl0SL51Knl6IaJp8yF1S3RTW2mJO7s/cm8buSYPX1vF3ROQNZl0A687DMDQ==]",
        'SITE_DOMAIN': "gohyer",
        'IN_PRODUCTION': False,
    }
