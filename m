Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795290605;
	b=g5gVcbJExeZBhC9YuNW6V1HZwpvMF5vBvYu2vl9/aiuYASyZ0vlrkvq+M/NzI2EbZQ0G
	 zW4E6SPjgeBeMfOYv9EmXFxIwDJ76Ge0r7J1v2Fs5BYMs5rXSNynFUPChFn8q2k0r1DsO
	 5GJiFYLmC7X5nc10XU2c4KYgnjS2zqgF17puKmBnjtPfgco0fRq+T5wbWOCQVitLaI53z
	 lyWyo/2mXjqDdUQ9/MfHoyVvvVR3Z8eOZWZEgF/6eL4NlICSbj6IMPG2kJvYaYfgCeids
	 MLIKcm/5RGQWZfgDFkXLynW5egAceVcRo0SraQrbfJSAM+ifvo1ju1YbMFrm5Au4lSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795290605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=N1ILjrfOvivQ9e4CltHPCcP/m7QhraXB8+5+5LIR19I=;
	b=hAWc+KmwM/W5HEM+hvHIlIGa60AMSsmb5e7maSSL3hNjzotDAaPPOy4XO8Hfq+fMQ+8H
	 U9tRfjFklDxYbMo3E7S+yV1kZgEcoV9cpDxpchDQxvAfqdqTrOciGDmP6C+ywm9gSrDkg
	 z6cQ9pUAkkPPUEI1rrlVvyi49QhGfnsrDH22TsqQkekjvadhu3KH/3AhjQ159nlJjJbzA
	 bRmNUr0IwX3BiXlp1Yw/6d02CLl53YnK6ngEFr5SPLQ+i2ZTti5Xkgcy620PlgOw4FR7I
	 YJyhXxKGXR6Meuf3Xr/SLaIv98jE3wQhmmsvksM4Zsns9YTePC1MBxAOhHadyKnuKVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kFKBAb4s;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2E7606A680
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 19:50:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C2E7606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kFKBAb4s
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so16392335e9.0
        for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 11:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795290603; x=1795895403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N1ILjrfOvivQ9e4CltHPCcP/m7QhraXB8+5+5LIR19I=;
        b=kFKBAb4ssO+Rp3hQt6Nei/xj+qLxlRImVk+6cB97NKoebo/rfqd4aTD8QP8R2WDHok
         Ld2/BUqWl9uq8yQ+XC1q4wkGaaL9W4aQXSFuyaC5B7GtDTKjK+hbdSJ7GUglEYT1rj32
         e86VhJv1js/oKqtdGyKSMoeFEnLRfXGSITzlNMwup2Gk8D6FW9xDCjJRtngLSK4bqSpU
         wOTQtZWmxfBLgOx+qBTlbAdlXTMj2rnqfkhTJT9pjP5k2pS8Pd3y3CCI8UQ0I9JEoVma
         q6JGE+N5KeJnE2QE2Y1wrTGxqDpJccDhEfdGZYDwm/qy0Mgc45j3apjKZB18IrZ1c2aM
         /88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795290603; x=1795895403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N1ILjrfOvivQ9e4CltHPCcP/m7QhraXB8+5+5LIR19I=;
        b=26CcufFIZsI68FJF8AeBDvw+Riz4ROjYTJ1Q0H4kCAFRYmyCAZ16hf350K6TR5+iNH
         sockc5eiGXd/31Tth3leoGNYIM3lf8e1YdXgR2laDkQgUbIWR1V2iDGDlteSgeuA0XrO
         FCqwtlF0+/KI9mHu1IJfQG69ThuYuQZY1G83rOlZV2ZmznOufNQwYyhNqbsXEtmPMz/O
         VNyyIN65TnEemc7XF/fLsLm5lMjxg+KIyhLu65GG2ALQpO+ghMOA2MBd/wEmcRdNTwYG
         Mwu+gnbqrHQcOUcw3xHzt8aiiGxVc4Zu7/EaMFaNgTjGf42tztvqnK//6oIGJNHoVhoK
         x22g==
X-Forwarded-Encrypted: i=1; AL+hErGKrXzpV2u4pG6fv1wY2CYoyyYk+h+ak4zKzgIdaJoEAYt+1+dv8cwIcnUFBUaurj9tiDwuAeo0Eg36yaqD8A==@vger.kernel.org
X-Gm-Message-State: APuU4Z9botpkFRYCvCw+etRuLfmZbe4WuyDaJ2Z2neh695UpEOnRvLvh
	yeQdCl+pL+Vd+IP9zHVAh+84sACFYA7/HhGQ+TMgV/0SL2xP9MScWf1cuPnev9DI
X-Gm-Gg: AZFdTZf1ZF7Yeyr3nsiAFAQM1XQnqE34NmLgaanu0SIYYyaWM0Ib5mVp/oe2je/FMuq
	xhrSprlxjCQYNUhJSFRx1NCDgzN1KD4CF/DqJHcRcOlbCdwSqmzeknpgeNenfq2pYyiGQmICLop
	apkuV4BvvIdO5lfqnISWk/kSsfFsNxaSU/IaTpkcbRe1cw6kdK7/vVBwRYYSMNiPG4EqzqDaOYq
	bwtifKfJR5UoW9nrxJECmjdmfHvvNEcJqPaagymDIjgTbhQv2ScKzMIV7uhBnBBM6gDQ0PYFR51
	I2Mp+XuwltUGUSeXnerBthG5lMVMRCXz+vj6szjp+cwmIx5oafYg28KTc7YyxZ20pOAIj8GnXot
	h1YhtGhiW/pLUw74jtfdMU1VbyO4yJ0aQSDMze+sy4bdAJWPKbElYBKB6ez4bgWS89n+sYeM8cJ
	3QYPQIewHQEo2Zc2OFqpe/+QhQY8rSABX82dbjAH37M4j/PLDmwZeSx2SzxPPv3Qp8FFQhFB+GM
	eF93YY84kVZqht1UxDYai3K48pJEQHt+j06kVY2TUCNo1gPP8zkbYsK9WHwJZzLxBJ7UttmoSv5
	XHWaIyfclHdMEtZdKFzsOlXVquUNdH8bm9jHqntX/tGbupjYJUhpZJZGrvk=
X-Received: by 2002:a05:600c:c8c:b0:4b7:6942:39bd with SMTP id 5b1f17b1804b1-4bb88820e06mr149032465e9.26.1795290603440;
        Sat, 21 Nov 2026 11:50:03 -0800 (PST)
Received: from unknown.m0rf30.ray ([2a02:b027:12:31d3:47a3:3d6d:45fa:53e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm196876215e9.7.2026.11.21.11.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:50:03 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
To: jjohnson@kernel.org
Cc: loic.poulain@oss.qualcomm.com,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Gianluca Boiano <morf3089@gmail.com>
Subject: [PATCH 3/3] wifi: ath10k: add firmware feature bit to force passive scan on 5 GHz
Date: Sat, 21 Nov 2026 20:49:39 +0100
Message-ID: <20261121194939.3647400-4-morf3089@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121194939.3647400-1-morf3089@gmail.com>
References: <20261121194939.3647400-1-morf3089@gmail.com>
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

On SDM660 (WCN3990), no 5 GHz BSS is ever found when 5 GHz channels
are scanned actively. Marking the channels passive makes them show up.
2.4 GHz is unaffected.

Add ATH10K_FW_FEATURE_PASSIVE_SCAN_5GHZ; when set by firmware-N.bin,
mark every 5 GHz channel passive in the WMI channel list. Since no
probe requests are sent on 5 GHz with the bit set, hidden 5 GHz
networks are not discovered, and the flag applies to the whole channel
list, so it should only be set for firmware used in station mode.

Tested on SDM660 (WCN3990).

Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 1 +
 drivers/net/wireless/ath/ath10k/core.h | 5 +++++
 drivers/net/wireless/ath/ath10k/mac.c  | 5 +++++
 3 files changed, 11 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 6272e0f62..6ce819e06 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -817,6 +817,7 @@ static const char *const ath10k_core_fw_feature_str[] = {
 	[ATH10K_FW_FEATURE_IRAM_RECOVERY] = "iram-recovery",
 	[ATH10K_FW_FEATURE_NO_CHAN_STAT_EVENT] = "no-chan-stat-event",
 	[ATH10K_FW_FEATURE_NO_QUIET_MODE] = "no-quiet-mode",
+	[ATH10K_FW_FEATURE_PASSIVE_SCAN_5GHZ] = "passive-scan-5ghz",
 };
 
 static unsigned int ath10k_core_get_fw_feature_str(char *buf,
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 5dd21f063..482195d28 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -846,6 +846,11 @@ enum ath10k_fw_features {
 	 */
 	ATH10K_FW_FEATURE_NO_QUIET_MODE = 24,
 
+	/* Firmware does not tune the radio during active scan on 5 GHz
+	 * channels, all 5 GHz channels must be scanned passively.
+	 */
+	ATH10K_FW_FEATURE_PASSIVE_SCAN_5GHZ = 25,
+
 	/* keep last */
 	ATH10K_FW_FEATURE_COUNT,
 };
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 8e604697d..7710310dd 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3448,6 +3448,11 @@ static int ath10k_update_channel_list(struct ath10k *ar)
 			passive = channel->flags & IEEE80211_CHAN_NO_IR;
 			ch->passive = passive;
 
+			if (channel->band == NL80211_BAND_5GHZ &&
+			    test_bit(ATH10K_FW_FEATURE_PASSIVE_SCAN_5GHZ,
+				     ar->running_fw->fw_file.fw_features))
+				ch->passive = true;
+
 			/* the firmware is ignoring the "radar" flag of the
 			 * channel and is scanning actively using Probe Requests
 			 * on "Radar detection"/DFS channels which are not
-- 
2.56.1

