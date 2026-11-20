Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174293;
	b=UG9U2NWbXJkJIU3kcYfKEdK8qiAgUMo3D+x5Raq1xMMJ7RUQJS8ng37u7+yWTVS1GTG8
	 a2BDozB8V+3m+OupiAj+z4lBD7V/iAB4sRcSAiXBMgO6eGN/UEPkjmhx0imDqhtC0UBIB
	 Uik97M2qqiVok9+y3Gf/BeV3EzW0hs/cEOClBgvmuq6rc6uAmfF9MlEdcaByR1KvwU55h
	 nz/8g6rk/nARjlEUxNyToglpJdT/kZIN9GBKSrEUuA+XHlcod9UntTZPqPj/pZVwZSdQJ
	 S92lV0PHN8gapvaxIEqiuV74JE4bKcNKmAFMShT4Ff/JnqFvOn+Ygwi1i8eyAkfWCog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174293;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RN3fElosL6X7ynaHhJ7HJN7Tql6O3iPIcev01utN+6w=;
	b=fHMUZ0vK7jIvyWbVpvYHWtWh96oYFXQj6rn+DO949Q+FIw/VuNwOO5Wdv2mymufHyDa8
	 tHBimsJcPWh1KEMHXG/TehqaxMOHjfcZos8PNY+K4hhQEPMBb1E3uQAe+ehvrdOWXpRbX
	 7+Io5V/nCVS9ROBXnwN67HbQ1BZPUwUz/R9spmPlY4orRSp+tZSK1HnjJJb2GDP4S0qZS
	 7G+qsyW5H44T7hoxwGdiAUg3zQ1apnq84HRIpLOUYRVXkaxCsDDyPH9wY5LfNb2VBGO6S
	 jCa/IjD8GoFpznh0Ka4TnWLVzDb+tmQosQMnsajr2UJ7msxVDUF0XqJme/WHTnktBJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="AUgbvX/T";
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E6D60A2611
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 11:31:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51E6D60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AUgbvX/T
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3866a784546so159496eec.0
        for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 03:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795174292; x=1795779092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RN3fElosL6X7ynaHhJ7HJN7Tql6O3iPIcev01utN+6w=;
        b=AUgbvX/TSS6tNw5+3KDU1/WIJKHjpbQMy9cnQ5YXRAaHrxpna5Zp6ZKGsAcscmH/2T
         0bs7z8iT87lW7QPiSWjT9wYFnKd0tP5IBzh0nPHoiC+j4Q1bTmiAt42xpsL303WQNo1o
         HATFaGB2+Y2prXnXdWrlnGI8a/S9vAlWyMs6+y+bb/xuS5pd5mPeS4fUBN4E5RM8Ba7n
         OmjDIoDQoMPdPDehkjxtXstmqU1s+kYVXEHKb1MTKzQh1x5qScoiYIVErpo0R5MyO71Q
         2nEeNiNfSaJISUhDU19Pm1e6vnFie5ISSiXudl+SGRTIkQsYa0abCU63FJYPw8hWcrRf
         k9Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174292; x=1795779092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RN3fElosL6X7ynaHhJ7HJN7Tql6O3iPIcev01utN+6w=;
        b=BRlLGv9MoXTdwkKXe0IxAnB2bf/oIkWV3FC3xqLzrZTH0DE8PKhAZJXokgP4jBX5wU
         aqBQ41+ZPObrc77EiyrxjklVCHsyfldbHXM0fdZcqlVRr7Bnfs3Kp/Y7AlYqfOIjya3F
         uKQS0ZzC0FYxHgFa4cHDdTTFZe0yBadn0kl0FD46BhB7h3CoHomv16e/b5M98zou43RB
         3VGNe/kUhkiYY5ZAH9gjwWfffMdsQBXVhpbCIV4txbSUcz7sPoDP3KMxXhXop+2fYUif
         qPPbvaFOV1tpeBC/nMFhZ6Xt8lOCKw3ljtqXTEW41TiNPI4rZFEMmyI+QuvvZkZEm39t
         5Wsg==
X-Forwarded-Encrypted: i=1; AL+hErHQhfqgBYT84QYAo3LIH2Qmm6Imyz1WIuBnAqAWWRAss34RB1NWtcMEN8BeUt/oim92M02uJ5uH9AAyQqCrmg==@vger.kernel.org
X-Gm-Message-State: APuU4Z912nWsRv8k/DxmH25mPYDS2Gq2vaUdyRsk171WD1asGI+sPEGz
	F3udoMRb3WHz+/0rZ1D+PDnjsGntpjs2OetvnxiIVqN9HxitlJnLsjWa
X-Gm-Gg: AZFdTZd4TbTfzL1ikHftlRhn4MwPAzhlKUXGglkxYwrioT3OKsFt1GsVLsHUWbKZmKQ
	xxG+n09/MbqjYevsmvOSQibfEUuEuOxkoQqtGKa7Wmh22/4TtJTZGYR3YZ97C/PaVU6RUrDKRDP
	dpToH8CVV8hwiXHbLjSuMarSv2tBPlgFGperp6O4vEqNZhxtp6Z4xQ+fwgCaJp9+LRPhVQGYQth
	xDu4qOYq4NZdL6pyK1dGbEriZZLzoibN1L4YKV09FnCCPSySCFk3esH+hqUzF4Ko8xEwnUkt/gm
	TD/IxJ1zHiF4flekoekZuWAHGFdhKs1qCbhhA5NuzSKdR1D4Rt6hW11kZJ4OWCqpxD7n65YkuZ/
	CVmbWe8zA+wb4DlEmDVzy9tQRh3pTVT7uQ7SBHrEcHQPq0gLTNsdVYsMEFvQA0t4TCP3DrJ47n2
	GSQX86gnthKxVr58KHvD6W1NkGcgWhATSqauuXjk0OROJFWDDcfz8jZ71J2SfSSlQUbK6efsBvc
	zp3zvAgqrDiMWAshd0m5BfUOZpeDp8al8YEM3HRyNEzhIpEEGWPr6MJDHG2V53bxIiCdTtyJHMf
	kU/EUxkxrnhanTZaurAJBbd3n1MnChD/I9BKHYqUSFCrrIupRwjiypanB/5Hk44siNcsor2A7rD
	QtKi5Y1VNiqYVZS9jpVtwKLi75bXRScuGzdRBKYh40IpU
X-Received: by 2002:a05:7301:78d:b0:385:bc4e:dbbf with SMTP id 5a478bee46e88-385bc4ee6c2mr1725380eec.37.1795174292223;
        Fri, 20 Nov 2026 03:31:32 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:fe98:6351:c2cf:22c3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm7134347eec.16.2026.11.20.03.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:31:31 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>,
	linux-wireless@vger.kernel.org
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next v3 1/5] wifi: rtlwifi: rc: start no BA session for QoS null frames
Date: Fri, 20 Nov 2026 19:31:10 +0800
Message-ID: <20261120113116.153232-2-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120113116.153232-1-hjf3108@gmail.com>
References: <20261120113116.153232-1-hjf3108@gmail.com>
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

rtl_tx_status() starts a TX BA session for any QoS null data frames,
so these polls start a session even though they do not carry data.
That costs an ADDBA exchange.

Check ieee80211_is_data_present() instead, so only frames that carry
data start a BA session.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/realtek/rtlwifi/rc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rc.c b/drivers/net/wireless/realtek/rtlwifi/rc.c
index dcfaa98198..f475f1b8a9 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rc.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rc.c
@@ -216,7 +216,7 @@ static void rtl_tx_status(void *ppriv,
 	__le16 fc = rtl_get_fc(skb);
 	struct rtl_sta_info *sta_entry;
 
-	if (!priv_sta || !ieee80211_is_data(fc))
+	if (!priv_sta || !ieee80211_is_data_present(fc))
 		return;
 
 	if (rtl_is_special_data(mac->hw, skb, true, true))
-- 
2.53.0

