Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795278974;
	b=VPj4juOWtKUrD/fpK2IU41a7t/A1+y7wreg/vtkLP7rsPV7NuUfh9DqLtSBaeg/h+3cO
	 2iNOXa1R9y2WK+QjoQAw+tv0PB/+SUnAZoq+FQi0xR3SDi7/V8Q5E8NaGC7Vkx2ni4UAu
	 h1+dALcRNqlJV/QECKPbOSbnuvVDqtDaWnrXO++oTjrQzIrSJTOY0L37MH5lPygXywzZx
	 43tD2k897d1/Rx30B9Y8XDaCg2VRqXA4LXgMs6DfQYHfvjdkXBt+aZLJ+Y3OmEviTEIk3
	 cviCbOv9H7OSgnjPEFVge+uFSTgi2XJZt1vBE6D+f1JA8mWSKjnh2t9JyZ9UPYAGOew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795278974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CN2TDQcri811lkCR+dibSRTuGc/getXYtioaM5I9ehA=;
	b=InIEWqakvuJ4eZUC2xHYGEW/Q/oP1iJV4+DH3dPWTPCOJ6eRGD261j5ErTszccUPbzDF
	 5uDiSfVTqEKIXzCAlAURmNCU2eu5xYyVRqFPYJrSKUpQMeJIyeSYf/n5LpDJacTbU/RnV
	 O/p5iTcFI3u64OEjNcX+ABP+W91MaI0QFLJkgI0Ty3OsQUE9Rxd5c9lE+EIw25qGtXQfo
	 sqKpxn+IyoZE0192AcPsRr6+RnJ2EoIV7/+uplBHmOUWzJVg9izPoB/eCfGJTOkak5Lcj
	 xocvSjbZDFirXq+SRnZ9+garcVnb9L5rvpUr1IrP9uMZGPw6ht2gXqptFId2jO48oeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F3opAT5u;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E62560A2629
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 16:36:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E62560A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F3opAT5u
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2f04ad2c46dso8831825ad.2
        for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 08:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795278973; x=1795883773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CN2TDQcri811lkCR+dibSRTuGc/getXYtioaM5I9ehA=;
        b=F3opAT5uT5WeMpA6P9ZDThjTkKAhTq/Mnv0NZsfDqtIu0emfdrxSLVpLNN/gaIuX+t
         gMcR963thMg0lWqpESd6MKIkd9xJ1pqbTBeyAmoYoFn9pONNSzC6ksgqxnPgfLHGnX2q
         9d2yuU/Q/BXx7wtUONmetVltMTL2LOK44Tv22Z2QL7DNJyMnbbuVOlEfej733ZP4g7eF
         9101yyJpqRyqldECZOBJkhGsD7Eyl1Ah+ZhOD1Hwzh2iMrVo48n7SaUyJzcW5YVhl5wn
         zJAPhHmIc4L2zC9m/KwG1oDH5FvqS9IJaFxLavNUzqp9J2MiFKu50paDxeMSVnyMGurS
         IcXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795278973; x=1795883773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CN2TDQcri811lkCR+dibSRTuGc/getXYtioaM5I9ehA=;
        b=rAKuPFW4Dwa/JyXAj2ABMvJFgVM2VsAfnsz5urZeg/92MJeUb5ONWNykeNZYkvgPlF
         7jfyAQqYuei6B+p1/JwXfygAPLE14LDx19Qsa4qNB96clklTbeFhi31lIi9OkPK14r4m
         3+ufkvJLKkeWVZVJqXOaJ4W2jU0OVK1d4Kh4fHHb6G9EO0jnlSA2WuyIZArlL1LEDMvT
         aBYoGRdSWh6A/ygszYIBMbvFfdevFDzOV38zjGtIB8BZRFanUA3IEzfQtUPg32l27Ece
         ZdazLpSf2+F1977IqjVSuiO9ioZ0dk8shv8h0UnrakaR8mQrQSnwvgBppdJaILhx7X+4
         n2rA==
X-Forwarded-Encrypted: i=1; AL+hErGPIR2iTOpwsvZC+FF2pz0JpdFTMyQB/NZLA/jyaw0MenZH4M5isbU7H1L1lo47f0zr61MOdX5Sqzt91tAtNg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+jHMwbPTdAyC/pyM0AKuHhD0Gw4lPcy6fqrssS4wHxcHHI/q9I
	yFactBpZbdKoV9XAL0/8FGOe5A624nfHiLXbtOVqWfu2is9OmJQQnLLH
X-Gm-Gg: AZFdTZdOoO0BianSiofrAbLy075k0/UOJZfvm4zp9DkUgOJ70D5RkRHzB1mCVpVAmNH
	tj8AwYF3wJewBiMio73m470izLY0rPzFfw5Idz9vjxzbMmQYkpt/wqnTFifN001vEqcPC1XyD8N
	OipC7cI6HYnKqMLxCwL91y4tzQj3UKiHeTta1yYwkusS9qefImwlo/jPokXKodykLag7+1Kc9YM
	9tlVFT3MZ/oVRhCIhCHfm1nyG7wjAanyCSg1MxPJHsdFMu7kGq9+WnvgPwg6dc0OtdzLNSGM9Eb
	tIwBiIE9iMpyKTkkkoVYUGhv7BToNsU8gugd4O0zx9DUDlsu0yjI5zmBqDng4Jpi9bb2TA2E6Jv
	ywNs1SpqSwufziYSjQFNTH/EDQTNYFoKlsOWCvwaX94GXtTiSCWHpbwhKqYNNqhOz0F5MR815GO
	6gkipgyhw5LQ2m5BRfDpjvA0tpa5/viHSSWu6z46tzLvkWakwRPYdLK10+FofMreP0F/a4qKkCy
	Fe+YKJ0pOsKKdkkIMfV6gk9qABBPEM7RZIjgIDBzuxT9OHeTfUexOzFmAd1b1dyfD/uJVlYCssO
	n1UFwFYNVXDZy/1ElI5yKDJ/2oX+HZ9FXoFmzZrGeuaKsp+pzVDkqJRQpiHo/utUv1VvkcNSzty
	p8lDc
X-Received: by 2002:a17:90b:1802:b0:3b0:c11a:9026 with SMTP id 98e67ed59e1d1-3b41c95fa0cmr6410192a91.55.1795278973307;
        Sat, 21 Nov 2026 08:36:13 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:8549:3fe7:526f:af9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d11753sm12357403a91.5.2026.11.21.08.36.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 21 Nov 2026 08:36:13 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Hemanth Selam <hemanth.selam@gmail.com>,
	Morning Star <alexbestoso@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next 0/3] wifi: rtlwifi: don't mark unencrypted frames as decrypted
Date: Sun, 22 Nov 2026 00:35:44 +0800
Message-ID: <20261121163547.37019-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The SWDEC bit of an rtlwifi receive descriptor is set when a frame still
needs software decryption. It is also clear for a frame that was never
encrypted, so a driver that sets RX_FLAG_DECRYPTED from it alone tells
mac80211 that plaintext was decrypted. mac80211 then accepts an
unprotected unicast data frame although a pairwise key is installed, and
unprotected deauthentication and disassociation frames on a connection
that uses management frame protection.

Patches 1 and 2 set the flag only for a protected frame that is not a
robust management frame in rtl8192ce and rtl8192se, as the newer rtlwifi
chips do, and replace the vendor comment above the test, which no longer
matches. Patch 3 does the same for rtl8192cu, which also set the flag
for protected robust management frames and so skipped their software
decryption and MIC verification. It reads the header only when the URB
holds the frame control field.

The other rtlwifi receive descriptor parsers do not mark plaintext
frames as decrypted. rtl8188ee, rtl8192ee, rtl8723ae, rtl8723be and
rtl8821ae already use the same test. rtlwifi's process_agg_start()
marks only the DELBA frame it builds itself. The usb_rx_hdl hook of
rtl8192cu, whose _rtl_rx_process() sets the flag from SWDEC alone, is
never called.

rtl8192d (rtl8192de/rtl8192du) is intentionally left untouched here:
it checks the cipher reported in the RX descriptor, so unencrypted
frames are not marked as decrypted. However, when a cipher is reported
and SWDEC is clear, it still sets RX_FLAG_DECRYPTED for protected
robust management frames. Ping-Ke, does RTL8192D decrypt those in
hardware (or set SWDEC / report no cipher for them), or does it need a
robust management frame exclusion too?

Zhao Li (3):
  wifi: rtlwifi: rtl8192ce: don't mark unencrypted frames as decrypted
  wifi: rtlwifi: rtl8192se: don't mark unencrypted frames as decrypted
  wifi: rtlwifi: rtl8192cu: don't mark undecrypted frames as decrypted

 .../wireless/realtek/rtlwifi/rtl8192ce/trx.c    | 17 +++++------------
 .../wireless/realtek/rtlwifi/rtl8192cu/trx.c    | 14 ++++++++++----
 .../wireless/realtek/rtlwifi/rtl8192se/trx.c    | 16 +++++-----------
 3 files changed, 20 insertions(+), 27 deletions(-)


base-commit: 0bdc579dbfc251a6b6838ee9459b6771b948c617
-- 
2.56.1

