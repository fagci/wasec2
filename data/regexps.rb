ANALYTICS = {
    :adsense => %r{pub-\d+},
    :google_analytics => %r{ua-[0-9-]+},
    :googleTagManager => %r{gtm-[^&\'"%]+},
    :mailru_counter => %r{top.mail.ru[^\'"]+from=(\d+)},
    :yandexMetrika => %r{metrika.yandex[^\'"]+?id=(\d+)},
    :vk_retarget => %r{vk-[^&"\'%]+}
}.freeze

CONTACTS = {
    :Facebook => %r{facebook\.com[-.A-Za-z0-9/]+},
    :Facebook2 => %r{fb\.me[-.A-Za-z0-9/]+},
    :Github => %r{github\.com/[^"\'/]+},
    :Instagram => %r{instagram\.com/[^"\'/]+},
    :Linkedin => %r{linkedin.com[-._A-Za-z0-9/]+},
    :Mails => %r{[\w.-]+@[\w.-]+\.\w{2,5}},
    :OK => %r{ok\.ru/[^"\'/]+},
    :Phones => %r{\+\d{0,3}\s?0?\d{7,10}},
    :Phones2 => %r{\+?\d{0,3}?\s?0?\d{3}\s\d{3}\s\d{3}},
    :Phones3 => %r{\+?\(?\d{0,3}\)?\s?0?\d{3}\s\d{4}},
    :Telegram => %r{t\.me/[-._A-Za-z0-9/]+},
    :Twitter => %r{twitter\.com[-._A-Za-z0-9/]+},
    :VK => %r{vk\.com/[^"\'/]+},
    :Whatsapp => %r{api\.whatsapp\.com/send\?phone=([\d]+)},
    :Whatsapp2 => %r{web\.whatsapp\.com/send\?phone=([\d]+)},
    :Whatsapp3 => %r{wa\.me/([\d]+)},
    :YouTube => %r{youtube\.\w+?/channel/[^"\']+},
    :tel => %r{tel:(\+?[^\'"<>]+)},
    :mailto => %r{mailto:(\+?[^\'"<>]+)}
}.freeze
