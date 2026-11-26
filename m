Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795671833;
	b=vCltun1FCHXGsIWwlsiHd7OO4Bp/uQK0rl/6KtTPT4grivFUzegytb4Du41begOVj3Ok
	 W3jBQbeDgHeIfRAaLS31Q5xl6Y5UzLrsAwIbz6mvDJSmlXF7RjdpWoillWf05TowHVmUD
	 J+rn58sbnsqNBATjvsGfSg1DQdPof3hS8mjVrAvkWI+K/pEzacLbEUCMDggRf1jt9r10k
	 mYrwNEZqXOrCNu7FTN2ctazesxkCjCBdltPQajaCrmY9pkh+Am+MVbQ2DAv/hGHgjmGCA
	 0cSh8cBeyPhWY5psCmnGrwqEpE++KXi2WDSPUa/zPndcb4rp1Eao26HbOYNw6ZvvLoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795671833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IjWEhqKblidu0NNXiwNq191cI1P0Mw4BZxYNdNdYS5Q=;
	b=xECs2Y5UDeZTbPuNAncJUqClH4Z1LVJ/BVrnwz2zBOn+CZMGMj7mWJEY1ah7dwNCM7Xs
	 ak5JeEjCwEy8h+rsykP5VOdBZTZTweo4vDoQpQqPWftZsyhTABn1PoLSRJHvQz+23C0t/
	 ub+mvtag5/UQKJt3qm6cNQq/v8psWJ2sfYtXLEbnqhGLg2Ho433Y/SQfaiXXlodwn+bxR
	 nyJSPyjmJSf+H8cisilWK3emXZHIf7328pdGVDCjExwV6fEqceRhJfzHsZjxqgXVSNaDb
	 7PxOTKHOo9+3BA1gAkhYp4rv9LjBeFyUgVubJlYMhbHnk+dWSlP6W5aZ0SGBPzdHxSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ne3uzrdf;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E79E606A31E
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 05:43:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E79E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ne3uzrdf
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so5456747f8f.1
        for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 21:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795671832; x=1796276632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IjWEhqKblidu0NNXiwNq191cI1P0Mw4BZxYNdNdYS5Q=;
        b=Ne3uzrdf87dnpkAp3soaNtolLsKaWcbEirA3AeMcFFU0Ubn++8UUgemfvjN7MNVgb9
         CgUdOlGvuATvWcm6aPL/7aJ6kaI+A+RkvcZtm6S7kAqMhu4ju/+bX51gryoMs9gCwSec
         8SYvOV6pRpap2zoe2FeuereNjBGwsM1NSPOQRbUA+Dpc1fdICzIkqfFFloBgZRRNigIv
         rOI6DmYxqoeFSbBOQVz7Jvu+3J4pC2fKs4Gn42gqQ+V8ZxqpInnyhQwduSn88eFR+lle
         qcmP41QNReFe0pwRv7vJRow5a5yG7PRuK9A5GyO5KxHuvX4jXCVdGtxOrod6FzZRJ6WY
         f4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795671832; x=1796276632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IjWEhqKblidu0NNXiwNq191cI1P0Mw4BZxYNdNdYS5Q=;
        b=M35ylwhAFDfdpvOxBJlCRG8CfInU6NLmEx/Cx+xrr2XfuAwgl8KPMeczK1HYUvEICl
         8ByG+c2E/M1YQr0GM0lObG3AWB+zoGPgHRrXBmgwVAMvx9Mw+f+eu05rbVw6ARszg7PP
         MHVl7UPEfX256CRagwQt4RtnUBsECcmQz9H49TB4h6riPL0IgMrVBCPaORVyyt7by+WK
         awNLeskl797CbjJ3qN2q+O5u+YEeDx2Sq6dRlNQ760mQTM+0wIWNCSj1AGEneZ0IPmu9
         ZRaQL+F9l+xMpm6M9h8qYAupsJ3o9DF2ZCFcCLZdx727BOPE4knC3Q1StCtV1T2zKFE2
         WkUg==
X-Forwarded-Encrypted: i=1; AL+hErEerZhhhlTkTqGu9Iyp9qW58rFvRTVeqCPNlx+eoASBoTsLL6d2BlTu2PrHoo/LQLL7pytuRzG/+5nilVsZKg==@vger.kernel.org
X-Gm-Message-State: APuU4Z++zM7aEr6HDd1ehx+/eZZgDrgdYdRPHIJUjYlFMgOrzRH8V0ht
	tiEWsBkW11BP9siCBOThsdWEvLpFx8r242xs2cDo15AgGkF9jrmpG43vxhq/Mi5V
X-Gm-Gg: AZFdTZd7VQLPUmE04uawAWdjNDaBmeZ7ssbJAZb5+r2qcICJAnrOBwpBUYJXg60sY3L
	TBBZkbf7PpRFUh/cMFuItFpQrxfQeLo2qKrw5FUm6emoxm16RL7CSk+BLShFzFI4cCvJKwSvuVX
	HXRJdwNapU/piCtSQTd1HK/XrI8YTsay7vDWScR+Df/mLydnqhgnBdwxSTBf47kQIsGHj1szw91
	URWF+Rr5Bupr/oxwmNIIKhcQRKvaCsyslv3Pg0mynPtbgXd+ivMKFr0PDNyqH1Rzj0PUIJeGA0g
	FkPF49OuZ1X/putPHf4sSbXNJ8KNcmSpBvNoDV4zodvtfDXc47r4P4t0tK9w66EuHjeaEV/J3Xc
	P1DeU3vlXNdGqfwRTSojtwgZhISLpAuR5GaZNr3H9LcHNNCl0WvA2hPHPsfg91gHkbLR/o1S/BS
	B0DfMFRXa+bLar7hc2vhJt+wdcIOZ+8NwNwRHmMLGuAFPbbNBTymk3vcRoIQY+h0oeRm5GGd+FD
	mPQnth1R3ScI7hvFF0fBOoCnSvCxXfxck7gkWz5fBZf6whadeL7cc0L8vpsfK8EMKfk/Hw5ZbTN
	tJapjXql77MuCCIdyQaafJla7IJ0c1TwADk=
X-Received: by 2002:a05:6000:2913:b0:4a7:7bec:e16d with SMTP id ffacd0b85a97d-4abb0c5d670mr39494437f8f.20.1795671831732;
        Wed, 25 Nov 2026 21:43:51 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm43959416f8f.55.2026.11.25.21.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:43:51 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: =?UTF-8?q?Georg=20M=C3=BCller?= <georgmueller@gmx.net>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Jes Sorensen <Jes.Sorensen@gmail.com>,
	Ping-Ke Shih <pkshih@realtek.com>,
	Shreyansh Khajanchi <hi@shreyan.sh>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [RFC PATCH v3 0/4] wifi: rtl8xxxu: implement AP mode for 8188EU
Date: Thu, 26 Nov 2026 06:43:50 +0100
Message-ID: <20261126054350.2893087-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <03be9df5-43e3-48f6-98bb-27d7d7ba2074@gmx.net>
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

Hi Georg,

Thanks. Please post the 5 patches as they are; untested is fine. I
will test them on my setup and send the next version with your
authorship kept and my changes noted in each patch.

Shreyansh posted a patch that only enables AP mode for this chip [1],
the same as your 4/5, and Ping-Ke has reviewed it. My test results
for it are in [2]: without the beacon fix there are almost no beacons.

So I would build it like this: your 1-3 and 5,
RTL8188E_MAX_MAC_ID_NUM 64 as Bitterblue said, the beacon queue and
TBTT hold time fixes, and enabling AP mode last, so that it is never
enabled without beacons.

Ping-Ke, should the last patch be Shreyansh's, carried in the series
with his authorship and your Reviewed-by, or will you take his patch
now and I base the series on top of it?

[1] https://lore.kernel.org/linux-wireless/1381CC32-E73C-483E-8F64-27EDE6AE8E6E@shreyan.sh/
[2] https://lore.kernel.org/linux-wireless/20261126052152.2887192-1-mehmet.fide@gmail.com/

Best regards,
Mehmet
