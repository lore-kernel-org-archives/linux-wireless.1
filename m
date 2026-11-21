Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795290600;
	b=vsymL/xzhACQr3cXHzdkabOpdjI0lqhckmq+xQPBFxiEmIb+vUq3uxWt1f49KGwsUWi0
	 NprK1aPdGaNDemvJhKEh1WqX2Y0VU8Sk5ZYJ+XC7Pehpnn0FVVogwo/pwJjoFZVoXKImT
	 1FOaXy/T9lJyvRchewDf+M3r3YnEbzlrAwiVMQ7DhL55AJ3m5lmi/2sA7l/E+jRN9362J
	 CbmfWykTJio7XmeroqcLxUjB+EMjbAvf/Z0I86CJqs8VK5QLpZP6xUuOkkST0wpadYRqo
	 NPguYIYuX/mk4JCX/N6e5StznrGXnud7bYAkZi1RkEQkkW4U9J+kZGiVLDuRn6Iu0bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795290600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jPNi713F9pOImhDVrHH7IF3TDFq2wI0T+LQ8lSB9bVw=;
	b=XbAeRsjIWKqftgUAEodaeex9wExwgKI7gJEwCa6RIoYFqC37t/V0CnwLl2eqclGCn3Cp
	 lcupsixrLtN6IOKicVO5+PJBYFSuPFIIL40ErPCHjJ4vVphGr7PvvmYPtvhHE+GGtEF+v
	 ZPMFizTAREJePO08EiZZdmdMvJZkeP6/2YQlyAIqVWGOOiBvQipsotHx7uBJxoUS1rHbV
	 sUOPh2DwvSsRvki0NGjnI3z03fq5NzkQ6hX+Jo7+J+bdfdNvWiq8IXKWceV/zdCbtZ4gD
	 Cne+PUB6aDDZwyjaU0pt0Xii3T2k7hHezPR3LuhRSZGL/RNwDciKAiThlF1FJ+mZa9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gFrJbL6d;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56745606A331
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 19:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56745606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gFrJbL6d
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so18013465e9.2
        for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 11:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795290598; x=1795895398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jPNi713F9pOImhDVrHH7IF3TDFq2wI0T+LQ8lSB9bVw=;
        b=gFrJbL6dFtWznzoIQltJZWkyWMukMQzFfNpqr1iwTfyDCz8hvwFDVpsEapO1k4DRmo
         GXmxkL+0qLoepFvGGHs7/xwyZrtMHv44A+72D41ks/UK9KWPV9274qp2J7yGpbPGmzTo
         /rQ0fC3OauJEQ6k743GCE5mdjm6eIBK5fV01n4zUeZNNaCOS8oIl2Nw+dxZ8WseoWUiz
         kCy8NidvRzKzTkHXt0Y1rV5WMH3IIqRFTXjkOhnFAIhVbrdS0wXgqTR19jeIPDZldFMl
         BJi56TJnSxy0MYMG8NQnbVfkrWmrF4eP932JPcdkJ5BXBsMJlTyDy3flllnJ23NR938M
         4e0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795290598; x=1795895398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jPNi713F9pOImhDVrHH7IF3TDFq2wI0T+LQ8lSB9bVw=;
        b=xwmtxoOPrBF4naduCthKBRlZtISS9UKGNp4G28ScPqkstCgJfW0/tP3LPVh6VB0vg+
         nZdzCRt3o3occ3OHYvKPtHBT6w4f6adDXou/ZjCMjQA/wEUlHIq1eKJsKocaph4Jut93
         p0U95QqQgGHagTE/B2efcVMubD4K79veSTUZhCRGVxIvwtwa8eO+OJls7xnwzqkuHLco
         dOLzbElldULAWK0vlSMEZ4nbv9fnXAsWzLQFSMB6afSGSOvJz+jYtDJYOvSLUfjtrbfC
         QzL6aN2s4ok5VVJvkqJ490MfmZxd5HSQSWH935ydAZxxv4w4Pwa5RorvA5GLB0igiQup
         +W7w==
X-Forwarded-Encrypted: i=1; AL+hErGfgxNPbA2bb9w4s/Dx0VvW9SaEeuuFtkETPfIG9Xfxqv0YXUDZNxq4wzZSpa+mQ3nzyqoVL8SSPw49uvtbPQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+0TebVmdkcRucGg12ZFWBHn6ZUn6Bju/tuURyOTIV/ctAQF0XX
	/UHA7EPDIADzHb/jypylNjt/TT1JAaacC9aK8o9gf1+EPQyUESmOrogm
X-Gm-Gg: AZFdTZevhFC3v6QiREKMT1BHP1actyreI94mqZt8+2cyYxJCzEQvJ5ws61GAIFmNNMi
	DVo/d7nJ69ZAdThb1yngeJrE8MHVwREoFAOWZZeCLeWEATDOy0aV1lGJlkgAB1H+jUXhmVISrqY
	U28SXq6RSQImzghHlgVkS9sXlrPD7GFVU3f0LRFWNMxgqIpFxworgHi5WvSlhkGl/Kakoy3yScK
	Matz6EYt9YfFbskzvE1icqqsjc3ttFEgOG0H3gHV1yovQYUNeKeugtOJX9rg/VRTRx0Ln7S7wQ9
	HesEI4Ojy1E5TN8G60KdYrwYTmaLSNlB/ew1XzhrAwVKt/nJeAsF86Kum9WwpVIlhDa2KX0dPTw
	koze1yITrPJQOAR1OI0RO5IgciSySUx4+6zhHx4FaWoxeMsX6Sow+g9rSi5s9ZgTaLIxoH18enw
	//KJLS11c9Nx8LTy/3B7b80FANaQ1rvQwKsY9G3xP8V8Q3IfN9xM0100w8f9cBTsT5HaO4s6ACe
	7AvMNGv0H2j0duHnWRPupTvmZbodk4dE0DKH+GWBVhPNdq6V+mLrdjzd8O/qIzYOEfkvgnH/rSR
	AbQgz+1Y4rirV6TfkeiD0KxgX8nUE858InuJJTMgmiiKMsbYWechP+MW1Z0=
X-Received: by 2002:a05:600c:4f15:b0:4bb:6861:657d with SMTP id 5b1f17b1804b1-4bb88923954mr170965775e9.21.1795290598210;
        Sat, 21 Nov 2026 11:49:58 -0800 (PST)
Received: from unknown.m0rf30.ray ([2a02:b027:12:31d3:47a3:3d6d:45fa:53e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm196876215e9.7.2026.11.21.11.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:49:57 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
To: jjohnson@kernel.org
Cc: loic.poulain@oss.qualcomm.com,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Gianluca Boiano <morf3089@gmail.com>
Subject: [PATCH 1/3] wifi: ath10k: add firmware feature bit to skip channel stats events
Date: Sat, 21 Nov 2026 20:49:37 +0100
Message-ID: <20261121194939.3647400-2-morf3089@gmail.com>
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

SDM660 WCN3990 firmware crashes during scan when the scan command
requests channel stats events (WMI_SCAN_CHAN_STAT_EVENT):

  qcom-q6v5-mss 4080000.remoteproc: fatal error received:
    err_qdi.c:459:EX:wlan_process:1:WLAN RT:2073:PC=b00a5d88

qcacld-3.0 only sets this flag when gEnableSNRMonitoring=1, which
defaults to 0 and is not set by the vendor WCNSS_qcom_cfg.ini, so the
vendor driver never exercises this path.

Add ATH10K_FW_FEATURE_NO_CHAN_STAT_EVENT so affected firmware images
can opt out via firmware-N.bin. With the bit set the firmware no longer
reports per-channel statistics during scan, so survey data is not
updated on these devices.

Tested on SDM660 (WCN3990).

Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 1 +
 drivers/net/wireless/ath/ath10k/core.h | 3 +++
 drivers/net/wireless/ath/ath10k/wmi.c  | 4 +++-
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 2aa18adb3..d37add4cf 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -815,6 +815,7 @@ static const char *const ath10k_core_fw_feature_str[] = {
 	[ATH10K_FW_FEATURE_SINGLE_CHAN_INFO_PER_CHANNEL] = "single-chan-info-per-channel",
 	[ATH10K_FW_FEATURE_PEER_FIXED_RATE] = "peer-fixed-rate",
 	[ATH10K_FW_FEATURE_IRAM_RECOVERY] = "iram-recovery",
+	[ATH10K_FW_FEATURE_NO_CHAN_STAT_EVENT] = "no-chan-stat-event",
 };
 
 static unsigned int ath10k_core_get_fw_feature_str(char *buf,
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index dfee43261..29a4c0d74 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -838,6 +838,9 @@ enum ath10k_fw_features {
 	/* Firmware support IRAM recovery */
 	ATH10K_FW_FEATURE_IRAM_RECOVERY = 22,
 
+	/* Firmware crashes when asked for channel stats events during scan. */
+	ATH10K_FW_FEATURE_NO_CHAN_STAT_EVENT = 23,
+
 	/* keep last */
 	ATH10K_FW_FEATURE_COUNT,
 };
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index e57588c19..adaf3c80f 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -7095,7 +7095,9 @@ void ath10k_wmi_start_scan_init(struct ath10k *ar,
 		| WMI_SCAN_EVENT_FOREIGN_CHANNEL
 		| WMI_SCAN_EVENT_FOREIGN_CHANNEL_EXIT
 		| WMI_SCAN_EVENT_DEQUEUED;
-	arg->scan_ctrl_flags |= WMI_SCAN_CHAN_STAT_EVENT;
+	if (!test_bit(ATH10K_FW_FEATURE_NO_CHAN_STAT_EVENT,
+		      ar->running_fw->fw_file.fw_features))
+		arg->scan_ctrl_flags |= WMI_SCAN_CHAN_STAT_EVENT;
 	arg->n_bssids = 1;
 	arg->bssids[0].bssid = "\xFF\xFF\xFF\xFF\xFF\xFF";
 }
-- 
2.56.1

