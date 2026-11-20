Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174295;
	b=LdnEjC8Rm33FCbIaSXKf9SbLRERkxR/o8tiwq7h5rMX4DRAH3lNGXynB+irC++84jLRF
	 BL0xcUzwEqJpP5Ek/kwnnEcc28Ub5P66l4B+/ecPq7UC5zIFIjl7qvBqCmOtGWW7V3bTH
	 7Tf9sjDjcU7VRyalALqCZi7HW2y23FkWGuaCWsSJiNj4T9SLVQab8ChawNy/22xGFFqJI
	 z8rJCzS4SR60rZQmxuUYhUraRsL3+GzVCIt6rnohpiBYOFS8Yc/pu5gUXiBrA8p8dKPtx
	 Z+n14AynQvVlKZvC3NRiJGPXW185hUUSMCF8YYGjnGXQNWeZzrBOtVQBUoxEan82J1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174295;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hkxoyXqRzjUlQ2y1QbIjQVZOtcd8DMCdNL7Rr20ynWY=;
	b=D6fLMC3hZsVs3P+aaoNGtQSR3OdBJvyDpLeKYMYbQb9SsD0JKBcf6D3IIYViu7DZOWef
	 ubjtUUR5QaQZDJimq4NjqUxF47UghEIBomFM0u/Kx/TEcFdU6LeK8Q9MH98DQOxAHI5CN
	 1Gne60vm6yJB3zGPjeXOHPgU/SNbOf2bm5FJ6MLivuoejl3vGqEQf16gHO7NUwLm79koZ
	 YDSshs5ch+Lr7m+HTaWBzvQNkO87qQDW49Npmo4+kQI3px3u7gUwx1Woo+B+57mLJVTUe
	 mKBqdPdxP3hIDhnCm8vaShhmvq670vPXH7b9bjqeypNklUWWmsgFGVwPPkTfexvrQXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KQzVyEyb;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2904160A262D
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 11:31:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2904160A262D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KQzVyEyb
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-38644aedba1so322155eec.0
        for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 03:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795174294; x=1795779094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hkxoyXqRzjUlQ2y1QbIjQVZOtcd8DMCdNL7Rr20ynWY=;
        b=KQzVyEybiqhhL7+5IqQj3S+P06TJgP8piKos39pF4jM7SgVW8syh4mfLbt/9KV8z5P
         fm5WWTpJt5Ly/E9pPKfvE/FX4iNBIPg1K00JcXSh8Agb3MxNHmwnbvmet4Z6+gCHelmn
         5N6M7QPPPkHns4KIdHTiP5Ri0Wo5pMST1U+EZqqS88Yp/fmXywbaktxv7kKkVl1rZb97
         +1E68B47qqZJZesj2AXjq8IZz77ZQD2iXARyFAxBJ6V2sDYxeT5EiCqOTNgvgV32ZYMm
         SDZuV87I5p1a4aMevKH1J9I/9spGWrYRwuDDCGfObAHTPWslxw1Y4jxwbKuE9aiqZMK5
         ExKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174294; x=1795779094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hkxoyXqRzjUlQ2y1QbIjQVZOtcd8DMCdNL7Rr20ynWY=;
        b=Mh2FrwbDRMKmGAkN3XO+Ya93EFYniwKGBcmtJQdH2OgOsvK3Jd5NHz7djAbigcwYp8
         i1/gOEa/ufh14gE1jlmuGPyB2Xlj9uw49KNoEtzWSyAO/Zrz159mGGDgproKV6ubgmYm
         pyTUtHBaJrPNVv2F3owmSvx2taMg8qtluKMJ+FFwB2bOLVYfPn/xBydQerapHjcpTffE
         cWe0UNy2OGhdAdmBLLBqX9WfNMLxGUfKB6+mQA7wC1d0IRIHwYaHwm2a9K+EujpgcfgZ
         9e3xfpEdoXoeQUlqaBRl7qe3Urx5BSffMltVfSwyJ7j4hxT4IbBm6O24NUY0yc1+1RZ4
         uRXQ==
X-Forwarded-Encrypted: i=1; AL+hErHsHed7WaP9sPLLjvJBcrSGKG7LquiPvLLmD0qj+pyd4NAe/VzDOOr6vhOIQkrypYTlAC+ENmy9y7P5KO1lkg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9jEWLKa7yjOklOIctuvrDb5wbXyESoJ+lUMbvC54HOb3qNjfwh
	HkDlf1uR2xCquaamFhZ2Ke58Dzmznj/8TE83bK2iUl1UzMo3LjyySOsG6t+aAaaiPfo=
X-Gm-Gg: AZFdTZc8kL6AvHlftgsp4YwaB7xLgOjxfldV6Xt8uHEX+Va0nOh71ycO/xX14Ci82qQ
	rapHri5Mj9n7orCIw8ZweiotxD7mzBeONU6an+qfw56HuRn6dLvaaFAiDjO99GpOZCv+v70Vnk+
	jC4lRmfobty+KhGzDpUlZ+bm74kXIeWlMVkpX5hFxUcCfgcwVryU5sXp5O48CthPkxviffxPHWu
	iOqnBehBpFGyrPp06sBmt5j3HEYS8BVWlrjLcH19vbtYJCy+Kl9kJDXsJtYGiVVfO6TSvXMikd3
	iQStzHELe6RaWdk//MhjtWuE5Y8HsP1WZ1sDjURyCoVmKYKCwI95Hkeq20iU0NlxMAjhFXInGj9
	SkCtv8oO+YsuipSO6YSv9oMpOEbYeXulCW9eJEh0OnX2ZSTezPt2ouk1lcCwCH7xJ+eyEm+aPFH
	AoFPLJCqHtqMPlwiLBj/IbOipG2SNS4ZlP81CDWGJf5est6f3XUcNNrjmqiENyFhTI0bciPtOEl
	8S0X9TLXcEAlqxtbZstGs30/+PiKCalgdIqsx3JJi+4mMFfya0Ux0fHOA5M5jcKwtz9nQ+4h51w
	OPskcSaUxuwXkoLHHVUGXl4JX5V+GM/EMa9kTZ42hfNGIH4LM5jAntre+ePQ8bNQDIaLYJ6F8Sy
	ceSHayYfXslfq/ftNqsyMWeoytDUsdpOVGEgxaqWzEzGS
X-Received: by 2002:a05:7301:d587:b0:381:d92e:ecab with SMTP id 5a478bee46e88-3856f25884emr2124360eec.11.1795174294252;
        Fri, 20 Nov 2026 03:31:34 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:fe98:6351:c2cf:22c3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm7134347eec.16.2026.11.20.03.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:31:33 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>,
	linux-wireless@vger.kernel.org
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next v3 2/5] wifi: rtlwifi: rtl8192d: report no signal for frames without PHY status
Date: Fri, 20 Nov 2026 19:31:11 +0800
Message-ID: <20261120113116.153232-3-hjf3108@gmail.com>
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

Only the first frame of an A-MPDU comes with the PHY status.
This makes mac80211 report the correct value when queried from iw.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
Acked-by: Ping-Ke Shih <pkshih@realtek.com>
---
 drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c
index 9f9a344920..58f7ad4027 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c
@@ -425,6 +425,8 @@ bool rtl92d_rx_query_desc(struct ieee80211_hw *hw, struct rtl_stats *stats,
 						     stats->rx_bufshift);
 		_rtl92d_translate_rx_signal_stuff(hw, skb, stats, pdesc,
 						  p_drvinfo);
+	} else {
+		rx_status->flag |= RX_FLAG_NO_SIGNAL_VAL;
 	}
 	/*rx_status->qual = stats->signal; */
 	rx_status->signal = stats->recvsignalpower + 10;
-- 
2.53.0

