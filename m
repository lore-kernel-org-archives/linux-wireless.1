Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509119;
	b=IrtwUuq+XzuvJZG5acalo57Hs2IxmQNGxK9GO63YZXhdg/siB60dsWCUA5/Xr9l6nZDS
	 NcRUse2Xtt9RiVLLlOklAkm3+xyUsOG9nmFj7iyaYB2gHopYLYvlJY/ARzUssEYJ82BlT
	 zw745PLdOA5nOsfHvRf6amiEyQ0WnfZx6ehpxkNhHZZpx8DoNxbRvnyhiwUFa533Q8AZV
	 jIVQdKixnzrIpRUy7Hp3+MsV+UzbBEaCJJInCnPYBhiAzI81xCo4sj0JKm9AgFRNOBAJU
	 iUmBAhiLmIfMXuGcGJrJ1BKaHEfX1vUAKAsISilVF7y16T8pV7XhSpjID7rA6DUEVSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wgNX0IE7lrAHlNokQcYly2H9sy8SXHVjq0j4actrlb4=;
	b=tr5Bjqm+BKHsLvH6TZqVCu9Inp55EVUzf127IS6/WZpSSEG8RCNaAQZ8ZjiXrjX2swJ7
	 gbAD+DbGzQwDo4VzPHBkX1yiVy6XhX5wJV9QQkwp9itpXqItkVXPz645UDSoKre/k2e9k
	 fqS/ASdWFFZhLlpucqu70NFH7kyuGCYsw7gOQgD9St/2fi+KDopX6W5pX0lMTe1bxsTgS
	 G5lxlF1nJogeo/eGatYC27DkvZhOiteNSW1olXWv8k2i8gHyEiVrkZnvJQ1QoMtyP2b4b
	 dceueen/pGOK1l9i27UmdhshK0MBnKg1lOlKfbsA6fdX2kpqxryST2VSwEDyBiEpVhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NH6JinNx;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5130A606A698
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 08:31:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5130A606A698
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NH6JinNx
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-492690dd5daso3184780f8f.1
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 00:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795509118; x=1796113918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wgNX0IE7lrAHlNokQcYly2H9sy8SXHVjq0j4actrlb4=;
        b=NH6JinNxaWm/M6cjlCkLE8VSCVC2k0dlsVonkb4Pd+T3o8IKDWpbMdRKBGVUnQR4vP
         fDTH+16uF6lCUAeAqA+48pMS+rbKY0J/NyqdMUwUa6jCfSX8VMMQ+0cKJTyuqCehBrqu
         vcccjQQ1HGBzAQIgLsVDW80K27vwOjW36vKkGPSIKiN+T4QOYYa7zYgegUu01nX50eN8
         +f1Cq4W380ZYuXtZjzd25+7y50pWEOPPUnSvnSE5BNpZYRBGiydfnPJj8zFuS1jQWcxV
         U5CwaZWVMvehUkw8TSfglibHwmUP4fUztWtKKkXg/i+Of2qlHKQ69nw1quZcEpULfruz
         Y37w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795509118; x=1796113918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wgNX0IE7lrAHlNokQcYly2H9sy8SXHVjq0j4actrlb4=;
        b=jjhp3Rf3CVnyeBIp2DtnRAHaiw4YtW47GN/Zu7dJon0zCnZgdIBk8LweRKnXF5Thfv
         XNlLme+3AW2MW5KcidKWoTrO3QPjOfw0sr9BQYM5q4eASXHpuXtsMEBhvPsFNfgJSrMB
         FjMqjhOQ7FW2+kh/KJPN029EitHfhAfc/OT6tQrB1ebTjZjlgM8QqTArKWEbiMiQW0Nh
         6p73/4gh84zH0SklpqFo/Hb4dt6RgAPHL0iX8bMEBzkMlbpgj6x6NvW1dP5yyHPxurK0
         Hx5+1kCr8lku2gL26zVc6QzkUay8dbquzYmzt2ijMxLckssbCKYTgU3zm1oyvyhCo1/Q
         EUuQ==
X-Forwarded-Encrypted: i=1; AL+hErHUPxJM5D2GRnHLdGz6ltmSobVEM5uC9ONkbO5n4TB0UGq+Coi2pZ5rro6pJpdBKAqOqYEsg7oi/Ytcbq1X4g==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Uw1p9DCX7tu8wODS4n6dSqbaxo/a9kZ10rUoCmX8N2zYSDI6B
	auin+tp7OJJEi/Xs0ZgFx1yl7JwotuIGV1FXIqTt2uMg1cGCslVjStWI
X-Gm-Gg: AZFdTZcMawRYMJWMLAEsl2dqaJ5LnKlBhKL1JvR5iWKUWRyeSHb3lzG4ZVqCEZaUU+g
	UjKe5pYwriHLuam+2jwvtYTGrkeFU20T9DCzzV6U1FH0U2OYSaqXX0nmPZa7OqkOSvGDMBqd3pv
	5umlvOKAV5VTJYpvompb/ToHlxVTthjkM+8MylY7RxbSWoEIY+k9DBEuJ9nLTRRdKjBs6cI+peY
	22ieCqStOvT9rXqygdAsjiX+S1UX/twDc6BIMwffI8S9J4cLeioIxWuki5Rk6Bvcap0/vMLJsU2
	f1InMwAXMW+ElK4qSgke8mYevD/Z2rN+YUdWxS8bGGNu+j/1VbcoNiDPwO4lVid5OxpPoeb8uFW
	lpfzhrON2yH7tJl4XMGUkldgWmklgGrLTZ0UZYhNCByfs7czZeSYD+7eHCoiyYhaNNWHfWrENoH
	SKxfeX0oXjjq2Ki5K9ef/rsxuvXhUcQt9crc5pu/GsijyUnGAH/N8yHvlcA4mnPWxb3D8jCUOIT
	Rkj7yBElaKVcHkUPw8QzSunL54l5xMQzaOVq9ZWwMqrnvTnBdtdWNVkiLyQbzXlAulrHzXD3PSv
	LbWchnQcVchI9CGeHA97W1NJj5Whxy10o8Y=
X-Received: by 2002:adf:e19b:0:b0:49e:f905:4698 with SMTP id ffacd0b85a97d-4abab6de682mr26643613f8f.2.1795509117340;
        Tue, 24 Nov 2026 00:31:57 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c4353d6sm25681121f8f.56.2026.11.24.00.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 00:31:56 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>,
	Ping-Ke Shih <pkshih@realtek.com>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v14 3/3] wifi: rtw88: time the countdown downloads from the TBTT
Date: Tue, 24 Nov 2026 09:31:56 +0100
Message-ID: <20261124083156.206506-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261124002437.213112-2-luka.gejak@linux.dev>
References: 
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Luka,

> Could the wait for the safe part of the interval use a finer timer, or
> could we limit CSA to intervals the timer can reliably handle?

Agreed for short intervals with HZ=100. A finer timer would not help
much on USB, where the download itself takes 6 to 17 ms. At 100 TU no
count repeats (model with HZ=100, rig with HZ=250). If Ping-Ke wants, a
minimum interval check can be a separate patch.

Mehmet
