Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795290603;
	b=QIK/WerIgj5aW/yCwTWyTwXLUnl/mPfKRoy+6lXmNIA2FK1A+EBdMKIBu8HKkerS412t
	 Jq6taw+G4UCIzHwjUAjnxW8YI9XS84W/lA4kq7FuuCMgznwhdOCVmMkm40ul01IEbZeCE
	 2wZTs2H2byG8ApH3j2nzJafp/uSteBpWruUVYN7Hxkk909F3lOXadc+e6wN4QUOgFUENX
	 1Uv1m2UmntzBgHWtsNBn+sUfbprqq5bKozYKxzgZ+cTK4zrFgNx7+rXkCf3+Y7Z6JSA/7
	 N7G+KuncBZEbmECk7nYlEkxdOe6YUrBwMWVJs4n7xRnGWDThCVWjmG9UgYkmcoHuoPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795290603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dUkauO/jYSTVRb3SKDOjoVU2Zv4gQ4g7Ob1cBy3r7jA=;
	b=laDEHGmSbkdVwidIDZqQsYtlCkURza757VcW1vTlgbz5zIcSGOxmUn8z9gkyZ1HAdAZP
	 sO3pCPg6il1IHJfGJDzAY8lsuiRvPSx9EtNQk1b43FUKRLakI03Hy3WXocelN1BHa2hW2
	 EfBUssJY04g9G/cuqs2LcDiRdruzuucut9qX9vEbLkPr6xPoT8Rl8WOlGNJrwScd/lWZM
	 MJ9IYa6vDgKs50nO9kKCgUJVpC1xZC3H+zF/ZUWfxDetT/Q9jQJGIk5OlMrkR8wOVgnJC
	 VBSov8RkILcgKLMjM9tE2FdYv52uCbTEr20h9lM9xynOcoDMxExymk9mphNW05YgyMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lZuTuoBO;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB123606A68F
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 19:50:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB123606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lZuTuoBO
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so12515295e9.0
        for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 11:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795290601; x=1795895401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dUkauO/jYSTVRb3SKDOjoVU2Zv4gQ4g7Ob1cBy3r7jA=;
        b=lZuTuoBOjPD+lSnlynZFnMINhxQchgQceWQot3a4HEEJR2TwMsxEbqEXh9QhHE75zp
         ozBfxVFLwKi4CIKdGo+fNyArCxFnThTCMxmjWiMNZnyp3p2dFusNwQgibaHIruA9rraj
         /KJqshFjSOWCZu3YYP9PNm1Nyl+5zXL3l9q+ib9O2piExv/T8yA1IhXfOJHwyi3lSOyt
         CgBmn2JtCNYZhGS66KJQpNmQ4ltsQ0A0/QgQV2GCsauatFg7FaPK6cddCs4W88arPqqd
         7n72ldIFYatM1HVGQ8RB4iTM7ojksYsOaUEqlNZZomymEcgTZpJty90BVTcA8ATI8jdq
         G/gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795290601; x=1795895401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dUkauO/jYSTVRb3SKDOjoVU2Zv4gQ4g7Ob1cBy3r7jA=;
        b=EQgZ89ElGDiBPzHZ0UA/3v6ZOgWSV4g4T9K2gsgHpbEhymhorvIhtMv9RDbg5x9x3G
         kgD8dBH5fd/qNNlrjDv97z8+moE4uvu+udT2X1a+iCmSbKFqpj9EvLz1uleR/VwRTDgI
         JVLdNopTCt85SU45TZTVt3kzDTAk7rOUSdXNVglIhQNd6ISkRVKnslL9ry1Fm7QGpJCQ
         8kQbM047XOmvHn1CFjEST+JyywMfalh4qzxJ+p/zRpNaloj8had+AAIcumk0+pZ2YzHK
         NRsYleGhcBZrabiehtiV5UkTGYntQz+GoNywFgC3V+x4nuwuzOPC44XcarNCKiADznAg
         2LeA==
X-Forwarded-Encrypted: i=1; AL+hErHJdUhP0biEXW+zpG1Vu/QRSjDFo8F4M0aL+uzjX+FfqL1+YtHMbkmXuD6N4rG9r777CvL3DsmUjdDPVQLahg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/7WEwW5Dz9ykum6fGgSktgWjy5U4hCQav3wyZ0zlO7YlMnrAxv
	uchOckR1JoUZ1t3/jPDHjeM+pMSLO0Nc9xdBu0NdPVwt4FnrelGi1o/2
X-Gm-Gg: AZFdTZfdDoyg2CK+5r2s5wCETu+li22gb8/OPUTFafw9Q1bUq5PtORcD4veMRjI+xc+
	BWfAz6QXuK1WdqX63KG+KJ15g+ayMkEcD4a+gqi1e2/jYIBA9AbLqKE4jUbmjYaZiVYkKRxDN7Z
	0ZyDIrVD15T2bCLNbLeytFw4/HpWnoESEpOAGqYPichAETf56Ao/X3TwwTPNtyG+d40HHqXAuo8
	eRR1oDnjTESYMhVgBNDnLCgHcKjNa65UquagFXyU8eh/iBBiQYtnHbJ7wOluXjfyBtSv3wAgUSV
	nJeMYEuRb9kp84YFWKMb65YXdKYWIcyURAGElFHPaASLxFcr7W2rgd5wRqTDqKM6NQIl7i2zlbn
	X77CHXglgp5ewouMok90hqCON9kL3bQHTN6nbBJeINz8qd5//zM1fIvYdMMaITdueWFpl8El80E
	ys6B9ODbj7l/s7V6sCvsBiUR6lNTvOP/z/f4yocWNPYkmO9dXTPLjnyWg1BnIYPhSU68OpbU8L/
	8EHg1i+QrARk4bi4Wtc59WTPPus+e6Nvr/DY4gtSdNsdmWDW6hnY+XoPEene10a3188mYaUdcLH
	tpMmRwm5MwZSCNbxaP6usYr443s2sz4qSfowCg==
X-Received: by 2002:a05:600c:1d09:b0:4bb:66fd:ad68 with SMTP id 5b1f17b1804b1-4bb888160cdmr156021525e9.14.1795290601026;
        Sat, 21 Nov 2026 11:50:01 -0800 (PST)
Received: from unknown.m0rf30.ray ([2a02:b027:12:31d3:47a3:3d6d:45fa:53e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm196876215e9.7.2026.11.21.11.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:50:00 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
To: jjohnson@kernel.org
Cc: loic.poulain@oss.qualcomm.com,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Gianluca Boiano <morf3089@gmail.com>
Subject: [PATCH 2/3] wifi: ath10k: add firmware feature bit to skip quiet mode
Date: Sat, 21 Nov 2026 20:49:38 +0100
Message-ID: <20261121194939.3647400-3-morf3089@gmail.com>
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

WCN3990 firmware advertises WMI_SERVICE_THERM_THROT, so the existing
service-bit guard in ath10k_thermal_set_throttling() lets the pdev quiet
mode command through. The firmware crashes on it deterministically and
takes the modem down with it.

Rather than hardcoding a chip check, add ATH10K_FW_FEATURE_NO_QUIET_MODE
so affected firmware images can opt out via firmware-N.bin. With the bit
set, thermal throttling through the ath10k cooling device has no effect.

Tested on SDM660 (WCN3990).

Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
---
 drivers/net/wireless/ath/ath10k/core.c    | 1 +
 drivers/net/wireless/ath/ath10k/core.h    | 5 +++++
 drivers/net/wireless/ath/ath10k/thermal.c | 5 +++++
 3 files changed, 11 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index d37add4cf..6272e0f62 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -816,6 +816,7 @@ static const char *const ath10k_core_fw_feature_str[] = {
 	[ATH10K_FW_FEATURE_PEER_FIXED_RATE] = "peer-fixed-rate",
 	[ATH10K_FW_FEATURE_IRAM_RECOVERY] = "iram-recovery",
 	[ATH10K_FW_FEATURE_NO_CHAN_STAT_EVENT] = "no-chan-stat-event",
+	[ATH10K_FW_FEATURE_NO_QUIET_MODE] = "no-quiet-mode",
 };
 
 static unsigned int ath10k_core_get_fw_feature_str(char *buf,
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 29a4c0d74..5dd21f063 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -841,6 +841,11 @@ enum ath10k_fw_features {
 	/* Firmware crashes when asked for channel stats events during scan. */
 	ATH10K_FW_FEATURE_NO_CHAN_STAT_EVENT = 23,
 
+	/* Firmware advertises WMI_SERVICE_THERM_THROT but crashes when it
+	 * receives the pdev quiet mode command.
+	 */
+	ATH10K_FW_FEATURE_NO_QUIET_MODE = 24,
+
 	/* keep last */
 	ATH10K_FW_FEATURE_COUNT,
 };
diff --git a/drivers/net/wireless/ath/ath10k/thermal.c b/drivers/net/wireless/ath/ath10k/thermal.c
index 9bb486f8e..c558a9e7c 100644
--- a/drivers/net/wireless/ath/ath10k/thermal.c
+++ b/drivers/net/wireless/ath/ath10k/thermal.c
@@ -139,6 +139,11 @@ void ath10k_thermal_set_throttling(struct ath10k *ar)
 	if (ar->state != ATH10K_STATE_ON)
 		return;
 
+	/* running_fw is only valid once the device is up */
+	if (test_bit(ATH10K_FW_FEATURE_NO_QUIET_MODE,
+		     ar->running_fw->fw_file.fw_features))
+		return;
+
 	period = ar->thermal.quiet_period;
 	duration = (period * ar->thermal.throttle_state) / 100;
 	enabled = duration ? 1 : 0;
-- 
2.56.1

