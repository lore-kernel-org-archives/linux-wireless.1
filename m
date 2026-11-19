Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795075013;
	b=whd7OSEJjwUZiOsM8QQVJpiYc/xaWKSLWLg28FQS4cLc2W3XyB7wAJA4vnES8Ef9XNOD
	 3maCNRGFvh9JV/2TU801VzJbVwjM/G+4wYyYjRjarlxo2r1Ta46fP6yI26YAs10saYuB+
	 Sv6J1KxhASx9QM5EmObJmEwEiRUJtBzrVnIWxHl3lbWf3+wBM6AZDJ4JxmUid6F28iPmU
	 1e/JDoBFtK8xTBzspDWaLmgsYLi8zaP38OxdpZ1z7YZPvk4hUlK1Ytdis5cgT0U4XPI9S
	 2Rj/VQk+47JWBIo5IIjHWeZBmH0509JFcp/xz6lbhHh2HuW6NhgtLK6j28UZH1pHinw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795075013;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xEoymSwj1gcF4QUAT7oBs9Zbj8EvbnCEDrEiMBfoV2Q=;
	b=CrRi6evBZBnaki+oFppaEsIxro21NbTzhdjnbAPRXVePhALQ6swJzehYdifoYCi+FADN
	 slvnYUqIA8eeBNerw0VvZgooZb3dTBtBv+dqhOtkO+NWY0N9RrTkjplE09iSm0bCk18i0
	 ddg6hN+qtD5QqWarEOIMkwj17YZg4c/lQJ/MhlBoHjhsBLXw13K+Zik0C8u0omZzRRulz
	 lPGYzzOO5gxE0w8zUWhPAUpexzfUGo1hamPoNlGIcnDajepyjUTBDR+qboFd6HjYVadvi
	 Qbzk00R5sS6gQ5v/Rg8OCv22CVDByVYjXyAnWdgxTeUKim6gng6R5FRC8LkxuyOVhpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MRgw5kVy;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47281606A324
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 07:56:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47281606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MRgw5kVy
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so2464959c88.0
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 23:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795075012; x=1795679812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xEoymSwj1gcF4QUAT7oBs9Zbj8EvbnCEDrEiMBfoV2Q=;
        b=MRgw5kVyPUNazSm4uS4KTyeR/7mwxUHLlA0GOOXHBznIY7dMo3LbCKZAs427tPRDM8
         KxnsItMUzyWJTC9as/BSibq9zfCUK0yfnU4UU/MVPGjn3skJd5LTrNQTKYgTYfIoV0RV
         VCDdMl/WA6yF3Xo9FF0SL6cRrsn7LCEo5ulLcGu8GCXbSPT5jTyTCVw5dHepQA7ujgI5
         yFK9tkMFFSw7/lSoO3QaDejHUmTaXMjcjGfJnNk3BjOSqHl2WMFe5yhww3r3u9RyIyHD
         U2GPhy49W45ixBifHQqF1rBdY/Xlhm4IzO/9uNr1+MnX5RatCJ/uxjrMOSrnihi0us6+
         os1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795075012; x=1795679812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xEoymSwj1gcF4QUAT7oBs9Zbj8EvbnCEDrEiMBfoV2Q=;
        b=BHl2Gs38eueAGDEkOD8Zo4UD6mBNBssO01u5tcn7c2il789+Djx85fXa53j1FeqR5r
         WMd7WIunjiOapeLWHB0cLRZeioRwsSo10Vp6LuJM0wrtSmoQxISvxgWwjYBhr419KQX8
         AyaAkYJ3LpeDiKSAQMU/sMe99eGlt/k4wPU/EHwNFFuB5MCYj/Z0Zwp4vMGYwGfhwmyL
         8IGxVg00yzikreR+P1/TmrGgjXGYdY7VWE/ZLNzlBI/rAWmWavZkNGgHQGvIIXkPVORV
         YJmQocHmzReBMzdrqV0fNtqxepeIksKadq3GeKE6XDpyXjQshHgnSvkPl+H1yrMUcg/h
         wjKQ==
X-Forwarded-Encrypted: i=1; AL+hErHLxD+Sp3rCT8ekW2+pH1ihHDqW21AC1d8i63zfdSaFsJ8Iq16NcJEp2DjVW64If3aCa4cP0fz1p5o0vPiCAQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/snR+W0A2LUwIGDfiS8KpCA4sBwoVrgzC07KopFsW5lWQyccb6
	/6erRIhhul6M+NpBkPVnArfyyVpjRAeyX6wfpNxLrYNlxCPUybLDE0rg
X-Gm-Gg: AYBFou1QnB8rmQuDykDsJW9RyssKOivElOTLZPiMbtyiJiAUgF7X1RmqrbhtNO0TMUy
	7yr7BtCWMgZbYWfCHWyp+4g/1wzlN9LsdmQtX9HQd36HGkBlAtWpb97xeXCyk/2oQjfbXX4B3Gh
	NjNNLFbYd4D+HJUmfJewsTlCdjSsIuE99KAMr3/2TeVtBK2kJgUR0KHLmZEwfDDUBiRV2O3Azsv
	zua++lj0AYKuZJs6uVcbFup3ck2F4xAkj8rtt/AZuctn2jQVhezx46Al/cMp/sscfT8kzNiIOZg
	ey2RkcII5UUJ2xv5wb2vJXiW8Pgi/1Yv2Vi7ej3PxW/ApoKBEl7+ElVKbwSPVqsZt0ybXazw+1a
	TwKyNydcxRGBsa/rvcoGu2lYusB3PaKTBnHtHTk631xXITRtSDWoaynXQTwMN0kuYLZQttsfyq3
	QtP19olRIhBM3VvFpL47JJD2Exl96H2Y3qw0UbhqDMCCRGQUrJci++7dGql1zJh6UsYvCnYlIbb
	1KhFEZjL8/T2TXhJQQs7DcGwS5ATEX1J8MfCCekEwkNmtNJBzo2N4ZyejeV/niE0JcorkTwB8sx
	FEaG7l0SvsI4gdIQ2ldD5FoYT6LLlN/CN7ITknp8ZRu2z0bmVA==
X-Received: by 2002:a05:701b:2202:b0:188:e51:e86a with SMTP id a92af1059eb24-1b543c14aaamr3714450c88.2.1795075011818;
        Wed, 18 Nov 2026 23:56:51 -0800 (PST)
Received: from G7XWH7K1F3 ([139.177.225.240])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5445eb29esm12778151c88.0.2026.11.18.23.56.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 23:56:51 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
	Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Zhao Li <enderaoelyther@gmail.com>
Subject: [PATCH ath-current] wifi: ath12k: fail the start when a service ready event fails
Date: Thu, 19 Nov 2026 15:56:28 +0800
Message-ID: <20261119075628.11096-1-enderaoelyther@gmail.com>
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

ath12k_core_start() waits for the service ready handshake, in which the
firmware sends SERVICE_READY, SERVICE_READY_EXT and, if it supports it,
SERVICE_READY_EXT2. Only the last of these events completes the wait,
whenever its own TLVs parse, so the start goes on after an earlier event
failed (for example, on -ENOMEM or a malformed TLV), with capabilities
that were only partly extracted. An event that arrives again, even after
the start, is handled again and rewrites the capabilities under a
running driver.

Track the next service ready event that this start accepts. Each handler
takes only its own event in turn, closes the handshake before parsing
and opens it for the next event only on success. A failed event then
makes ath12k_wmi_wait_for_service_ready() time out, and any event out of
turn, including one after the handshake completed, is ignored.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Cc: stable@vger.kernel.org # needs adjustments for <= 6.12
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Found by code review. Tested in a QEMU guest with KASAN and a test hook
that feeds service ready events to a synthetic device: without this
change the start completed after a failed SERVICE_READY or
SERVICE_READY_EXT, and duplicate or out-of-turn events were parsed again
after the handshake; with it the failed start timed out and those events
were dropped before parsing.

No new W=1, sparse or smatch warnings.

AI assistance was used.

 drivers/net/wireless/ath/ath12k/wmi.c | 22 +++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/wmi.h |  9 +++++++++
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 75b259990c79..89e4dec07534 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -732,6 +732,11 @@ static int ath12k_service_ready_event(struct ath12k_base *ab, struct sk_buff *sk
 	struct ath12k_wmi_svc_ready_parse svc_ready = { };
 	int ret;
 
+	if (ab->wmi_ab.svc_rdy_next != ATH12K_WMI_SVC_RDY)
+		return -EPROTO;
+
+	ab->wmi_ab.svc_rdy_next = ATH12K_WMI_SVC_RDY_NONE;
+
 	ret = ath12k_wmi_tlv_iter(ab, skb->data, skb->len,
 				  ath12k_wmi_svc_rdy_parse,
 				  &svc_ready);
@@ -740,6 +745,8 @@ static int ath12k_service_ready_event(struct ath12k_base *ab, struct sk_buff *sk
 		return ret;
 	}
 
+	ab->wmi_ab.svc_rdy_next = ATH12K_WMI_SVC_RDY_EXT;
+
 	return 0;
 }
 
@@ -5148,6 +5155,11 @@ static int ath12k_service_ready_ext_event(struct ath12k_base *ab,
 	struct ath12k_wmi_svc_rdy_ext_parse svc_rdy_ext = { };
 	int ret;
 
+	if (ab->wmi_ab.svc_rdy_next != ATH12K_WMI_SVC_RDY_EXT)
+		return -EPROTO;
+
+	ab->wmi_ab.svc_rdy_next = ATH12K_WMI_SVC_RDY_NONE;
+
 	ret = ath12k_wmi_tlv_iter(ab, skb->data, skb->len,
 				  ath12k_wmi_svc_rdy_ext_parse,
 				  &svc_rdy_ext);
@@ -5156,7 +5168,9 @@ static int ath12k_service_ready_ext_event(struct ath12k_base *ab,
 		goto err;
 	}
 
-	if (!test_bit(WMI_TLV_SERVICE_EXT2_MSG, ab->wmi_ab.svc_map))
+	if (test_bit(WMI_TLV_SERVICE_EXT2_MSG, ab->wmi_ab.svc_map))
+		ab->wmi_ab.svc_rdy_next = ATH12K_WMI_SVC_RDY_EXT2;
+	else
 		complete(&ab->wmi_ab.service_ready);
 
 	kfree(svc_rdy_ext.mac_phy_caps);
@@ -5871,6 +5885,11 @@ static int ath12k_service_ready_ext2_event(struct ath12k_base *ab,
 	struct ath12k_wmi_svc_rdy_ext2_parse svc_rdy_ext2 = { };
 	int ret;
 
+	if (ab->wmi_ab.svc_rdy_next != ATH12K_WMI_SVC_RDY_EXT2)
+		return -EPROTO;
+
+	ab->wmi_ab.svc_rdy_next = ATH12K_WMI_SVC_RDY_NONE;
+
 	ret = ath12k_wmi_tlv_iter(ab, skb->data, skb->len,
 				  ath12k_wmi_svc_rdy_ext2_parse,
 				  &svc_rdy_ext2);
@@ -10788,6 +10807,7 @@ int ath12k_wmi_attach(struct ath12k_base *ab)
 	/* TODO: Init remaining wmi soc resources required */
 	init_completion(&ab->wmi_ab.service_ready);
 	init_completion(&ab->wmi_ab.unified_ready);
+	ab->wmi_ab.svc_rdy_next = ATH12K_WMI_SVC_RDY;
 
 	return 0;
 }
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index b508aa759bd8..59bf691352bd 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -5397,6 +5397,13 @@ struct ath12k_hw_mode_info {
 							    [MAX_RADIOS];
 };
 
+enum ath12k_wmi_svc_rdy {
+	ATH12K_WMI_SVC_RDY_NONE,
+	ATH12K_WMI_SVC_RDY,
+	ATH12K_WMI_SVC_RDY_EXT,
+	ATH12K_WMI_SVC_RDY_EXT2,
+};
+
 struct ath12k_wmi_base {
 	struct ath12k_base *ab;
 	struct ath12k_wmi_pdev wmi[MAX_RADIOS];
@@ -5405,6 +5412,8 @@ struct ath12k_wmi_base {
 
 	struct completion service_ready;
 	struct completion unified_ready;
+	/* Next service ready event this start accepts */
+	enum ath12k_wmi_svc_rdy svc_rdy_next;
 	DECLARE_BITMAP(svc_map, WMI_MAX_EXT2_SERVICE);
 	wait_queue_head_t tx_credits_wq;
 	u32 num_mem_chunks;

base-commit: b1ed5a45b994a6473ca1cf34f35a1bf87f1d8e2a
-- 
2.56.1

