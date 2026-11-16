Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794865776;
	b=Si5g4q52JMWG5VSZdQycCZrFTSCxClvYPxyyzu2sy2fcKO5XTGStI7pc1mICrhUb55mv
	 KeGxVTp2bvdyt5x2UghDsvnWFhkICu72ClzOd6umxvn/Y94OxRzN3fDjx99ImuYcnyk19
	 lfRHXo4eKc7YKdt3jcrTeQOx8Sa5UvxlljtWoGrceXkBpJMfv3sodCzvcqcVRSnt52X2f
	 wIWVuS72YnUAeql3qBRYgtBbZwaiIuwcjw/GK6JSFlp1j7ZGuX5VUNyprrTTwy86iOUb9
	 zS4TT34j5Xjzas7Tj1tAQUgevf+yD8dvdl5GDqCitX/aBuZODHNqQa/kg4JH9fGzyZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794865776;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uakBzQHpnruk0tRar0RXS2ZBRRSBv/kAwPvqULpDtWY=;
	b=E4P+xaMCac87nIEQ33lDBZsMHNlTgLuoE4ZwXEZ28LyUewccGARokB2lQA6K2mYmNmmG
	 X9Vo5iGbSn2hgEyamJZzoR6SRYsFv3OFzfc4jOw1bVhRMFJmBGw+3ItbAQVUc2PKOfGKh
	 MJb9PNC8ZHbEYjwfEadgCMAVjbeCViVN+5HMcd8FCzTimLv3848eq0Z6rqgy0yxliN2/1
	 hI3dmD/cJpWP7tg9FVQEJlg7FzS5WMKZoLKr9F8OpDff7Dq/aGM1B6qnPtjSZ8YAehX6n
	 GXVzwZAarIdtKunRw3idZ52SOoz109iG+EBdT5fuxu+NdCiRsGs+ONEjDQIwadIyZng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E+hjxuO7;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E08606A323
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 21:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90E08606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E+hjxuO7
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so27049795e9.2
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 13:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794865775; x=1795470575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uakBzQHpnruk0tRar0RXS2ZBRRSBv/kAwPvqULpDtWY=;
        b=E+hjxuO7iKRJ3ueT3ZvIUPsmnnATLyhItSygXKlGMjYCVBAqIsaxwYyBS7WtFRNa2d
         FAyI4n8S0MnvngzX2NIilIZ6REX3+ej4wliGoq9olX7jUaOUFnuZ6NHbnreJikmMa+zC
         dfQheHijyPWjUdisMEUTyhIQIVkWbdVf71/CNoC7acdTDXKyrdqVSPdu3M7Caw81xUYq
         qiRaDxGxbjmmUVNcXVoZr+Rd8b5ut9GexxUR6Gsm+22VM+jEwktVh36jLU1BvMx0GFpS
         8Y+B19/v67a7W0WhIKz8UBqhq5DYijPx4bPUC+m/Gq1Hb3lYD9ewQ2XytPivwRA1VYzf
         CnwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794865775; x=1795470575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uakBzQHpnruk0tRar0RXS2ZBRRSBv/kAwPvqULpDtWY=;
        b=rdTvA236qtIOtqfq43NlYBL0OmKtF4MEio0VyEvipDbVnM2IsdFeMUbVw8hW+/8Kn5
         L9In2nkAnfWRwoWcJUd6hNqtr/7IPe9IWaCrhheoYbkHtP025ObWZnEs5POTE6x+sQef
         u1C8t2hPtvmgGfjn6SGRpdhBxBuCiXMuWxcPOeFn//2Ao6yy37bxIkZQ4bOEgFm3FeYo
         76HBfovunB/sJSTaH+c4C81nu7Px25vBHey0Q8EIGEjLFdkDu1Chvl+rb8Hsz7eRin+o
         ZVJlKgEVJEdG82GJEDpov+pXqDf1UzPXGfEuuWbOmmXCx1p9z2ME0bYDhB3rGjueJWb1
         9MXg==
X-Forwarded-Encrypted: i=1; AL+hErHZbzXU7+wAaTVvHiswi1ITe8/gtVTL6wAd0NJE9slsz/GwrzHjtowuVEexZQhSKOy3t/qaaBhlaaHUQzbIKg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/RbZYG6tmoc+ilO65iOi0NABz0D2sra7TwjOs6nKA97xieGLen
	WNM1+1D910dI3eUI4DJ43D1Kcxvc6i3ebChWWEQ6Ismx4HK+2aLnuSFR
X-Gm-Gg: AYBFou1mt9JKTbXj7hwfYu49AiDdBPfmonlupRDXu3Rc1/ZKvBVgt5SXD273xlBLmvW
	6mgV6p0grrHzNfytixaqOJ9l2yUiTjYOCIeuUvvJR9QbqbUXn2z+FSnpQgUB1OIjWn+g1uqSPMZ
	BhT6w7jYuaWWvTQkRMPDClujg3E7vUs88PEzdZ36YdL6eqLJBI/32z6tc3D3HS01CxNhIHif4TR
	L7jm8TMvuHJldDsyTOXze8HY30tuqHzRFja45/fRfEAn3C6ThL23+TRf4G8ipHoCY2qaP9Tbxkf
	YEys1oE5VSVNROOmA5n/igMPetEaTJaw/dyz+poNnqw2Ov3+aOzO7qiG5xzO0Ux423wX0UV/J1f
	TC4Ydz8lpDDcpNLUa3Hj3di5W840YSYsno/9pugSwUulqaJpTcruGNiXm7/1PdY+K6yjl+XJOKB
	zbdXIsK1pEH+XfQt4skmyWp7+78y0ksb6NXLPNFdmmRLqq/4kfT3MQMQqANHbs9zdYdTcY3IFpd
	ZbHNtxbaARkNthFyDuSKr2MqwgotwUaZ4OajpQJwMZ+WqdrTca2h/7CtTQvsnhMMW6u++Fxn8kk
	NmnfUvLrT5H9SFLOaefY7Z3J2mG1ZEvkIno=
X-Received: by 2002:a05:600d:2:b0:4ba:761:c0c5 with SMTP id 5b1f17b1804b1-4bb55a581e6mr192961515e9.5.1794865774974;
        Mon, 16 Nov 2026 13:49:34 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f7eecsm30265735e9.3.2026.11.16.13.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:49:34 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v11 3/3] wifi: rtw88: time the countdown downloads from the TBTT
Date: Mon, 16 Nov 2026 22:49:33 +0100
Message-ID: <20261116214933.1569681-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <781999FE-B0CB-4D6E-8A1B-06A38082202F@linux.dev>
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

> Could the next step wait for a TBTT that can send the first download,
> including when the first work has missed its scheduled one?

Yes. In v12 each step reads the TSF after its download and queues the
next one 10 ms after the first TBTT at least 10 ms away, so every count,
the first too, has a TBTT. A step that would run less than 5 ms after
a TBTT or less than 10 ms before one waits until 10 ms after that TBTT.

With the first work held back by 90 to 100 ms and a count of 2, v11
switched without any CSA beacon in 10 of 12 tries. With v12 and the
first work held back by 95 ms, every count went out in 48 of 50
switches with counts 2 and 5 on an RTL8821CU, an RTL8822BU and an
RTL8822CE; in the other two one count is missing in the capture.

Thanks,
Mehmet
