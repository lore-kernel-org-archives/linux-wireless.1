Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302478;
	b=0DLWwLfyiaS8EaykB8X8ArvAYaOQuKFECQQsUTytfpS2DFaQptxDsFy7fPAp5KigphFF
	 5Itua/cGbxCkrbJ9h5KLZpxQ1Yj+/0PdyDWlBlbls3XH1/mp9Eh7+fghrvM4mYiwsQvbb
	 Xe40+26l1iqxTOEkkBC76R0C5TxpPV6ip6ZwhPNcWzXGQmU/2e7PSgxb0ChFIW6TYcEaE
	 N3c7AbCl6p0AUsPQqCY0T5NjZX0/yKmqkAXtiuUDGuJdCXpJtRU7HvrmENg1nyy5UDWie
	 F4QSQw5rgXoqc+xQbUbRCX93S4dTkhovWqXwg/+iu+oLd3KgAPgOAwFepGJ8jaMFqhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Jfrh1uIU+/waSgkZCGYbAyxAmQdxTwCrEPYnNRV069U=;
	b=lq/G127O30hIU8TSOJ/Ken6MfqRVtjW1C7FnzQ5Q8iUsR1uhghWEAMYn9DXbHq8swIVs
	 m5j8wEmMOrNl1hWekc8XjKRzaqGAkhwN2pn2wNfH4KTletU7W74hhaH4jeOwbnlkNng5S
	 EzJWGkAtVH1iL9+dK/3tLDHPVP9k252HBKIkR7MnNPr0XlkqSUUzhL7oxhNozvaNd1C5e
	 2tyPcnM4n6hxgKTUvXfu9GA7ehZqQAbf32PGfUvg96pPWs/KvIiy6MQYlaV+rAA1XC8db
	 uo2/g67pNk86m2LBHoBeM/a7ydK/38giOwDSGLW/P5fdyu0xMvzcoW8Bre8WkJrC2TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Y4DSGDzW;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B7B60A3832
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 23:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13B7B60A3832
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Y4DSGDzW
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso477296266b.0
        for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 15:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795302476; x=1795907276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jfrh1uIU+/waSgkZCGYbAyxAmQdxTwCrEPYnNRV069U=;
        b=Y4DSGDzWNrPyJqrxTJ0lhKrSAz5dkggFsvVp8ZiyzuBH4JqzRQmwoc6DgZHpcvehiL
         iUbMNef6MIxzHOfL11EFzsKVrP/M0aBGWJxaeUgmj4dz4xDbAbzDU1C5z5ZJFEyLDEJQ
         s6zvSZBRqCks5EQt29Vj9H2Z/7m7LmteMeEGqMc2xdWPde0/DhJHeoGGIkQQbENhRf8Q
         9vUKu9rps8MXskdv36TFGMaGe1/xABojop4Nx8y9mSw0VQ+KSYu3u9MjkRg78OR8GDhi
         3WTWfVCqRFUswal7fmVf6OYDCBrUSg5h+ZadrvugMkkYfeHptfu8t17sWuf0nWah84Zy
         mXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795302476; x=1795907276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jfrh1uIU+/waSgkZCGYbAyxAmQdxTwCrEPYnNRV069U=;
        b=2b+jPITlE7YLhh2Q8/REdhYJuQMalFtfGM8CXxiD/vOK7DorjaoPjvNyven2DQRRne
         hUha8VICzc3/b2y63F10oQruP13kvibumAQFRSTz+ZsxSIMIRFW6kq4L16A61DhQD4Pq
         KuCs/29LvvfLmdhhjJHXTD4C/lWuVFxWT8hKZ3RlV5uDJaqcavMQ/kI9jtJwd0Ab61+s
         Gnmv4ZKkyCAbGsgEngQtr7qWNlNObJxfJ/nJ+U+X3EGjdXyDJJr2kiFz/MYhp4ZdcpAv
         DcikfbQUO2kbXL/YmHqyDpUZYMlpgy1LThIyf2EsKiPx7oEmit20XtbHYoySskZy4pqh
         2Qnw==
X-Forwarded-Encrypted: i=1; AL+hErEI6u9p5yhbomko1tO1IeeRtrBgw7ENvwU4tOsSg0w97si2bOtRuFWEIu+iAs+qfhGd6gC9Bzhvfgb6iOR29A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+450Y/6fMGvVYnJPtBFTg0++w0G7RfbmDdycnsKaEF3YRSkuwU
	AAzLAZ0yWGcQ4McVLpSCaP3LZhKsSz8XeMbdFlDPEGZaAqm8GqlKytjGYz5Yx+OVJw==
X-Gm-Gg: AZFdTZerBz+MxxREBij0RnSPXhx1SU+CaEHSWJ8cJU2CkA1QE9NEz2U8nZ/5G8XhD/Y
	lCBRssUM0u6p4f49RWJvqpIR/oDkbpCBGtWPFBq+6Vr/U0k8Ew/e26RBCvipFhHI4HqbuSj5oyy
	dFdBmAl29qvJy7ZuwaBuw3652pPICY9y62EjTAsTEyLFFHUjp3PKXHpSZbioYyUtlB9b5tlvqVo
	HCkddsogEDKUdmokAI0Myl7rTFFsaMECZq4CWelu7/IYEcF1orLhJzFtzPdNrIbfnHliGbgCCpB
	4xG5+/d/82aOwu9ovmRudZsIUkRzfkJtC36Ic0Po8WD8dZqpNEouYIVkITYcU2cmIaIL/4mWPiN
	5Y7xq7NzMEi/uPKmsYX6ZvApYvmrnQ60hnZRI4y+twu/fRTz1hOlyBgO7uvI1kEtKF/H5Ooo5vD
	Yd1usYPTkysmkBveDrLQXbS8MllgbOnTsTUebUhgOG+hx+rvgyr4+VcSA76Ss6J6pj4QRupoweQ
	yBWGsPi6p1pM5wBA9U7VJFB+e98Lkp2dVaVkRlsA4WRhTmT+riLATUJjo6SUXctuKHz6korV6Xq
	rDXqagiOK/Y5mvjap3yrho/1XYntNJlSePrdfue1VK0CSLsyrFCEIHsu642QMaShAFGmyJXnjV8
	6+LQiGNUup71qGRPqfmICUGw0A3TCqdf/xzLjnFL6Z/x2jkxrFPdJRHEbHG1mmUwxpRDV2bhfEy
	gOKp1NqbUOdOu1ejSkT0lvf0S5ruW1BOj33XSNNhbH+yMzF17sKBu6J0gEV/VxJbH1/ZNHhrazx
	3jn3cOGnIXDBBoe80TIBsrNnTBHUselZ23VOq9Q6X+LLDu7BkP1c47vNe1Phd3OmTuargFlQuiq
	lEJ7iBo2LNi2fyWqCafplc82jddvXG6z42fuWoqQiMz/tnTNrZJlU3ToznhVu9BNA3GT+z7d8Dg
	=
X-Received: by 2002:a17:907:3f0f:b0:c41:9a35:17a2 with SMTP id a640c23a62f3a-c5131a6ef04mr809669266b.31.1795302476575;
        Sat, 21 Nov 2026 15:07:56 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470edf0034412c7e8f5a5e7a.dip0.t-ipconnect.de. [2003:f2:470e:df00:3441:2c7e:8f5a:5e7a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc1b40sm242721466b.54.2026.11.21.15.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 15:07:56 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Florian Maurer <fmaurer@disroot.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	John Crispin <john@phrozen.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Rosen Penev <rosenp@gmail.com>,
	Jiale Yao <yaojiale02@163.com>,
	Julia Lawall <julia.lawall@lip6.fr>,
	Anilkumar Kolli <quic_akolli@quicinc.com>,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Sathishkumar Muruganandam <quic_murugana@quicinc.com>,
	Muna Sinada <quic_msinada@quicinc.com>
Subject: [PATCH ath-next v3 13/13] wifi: ath11k: keep the cooling device across a firmware recovery
Date: Sun, 22 Nov 2026 00:07:31 +0100
Message-ID: <20261121230731.1206043-14-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121230731.1206043-1-julius@bairaktaris.de>
References: <20261121230731.1206043-1-julius@bairaktaris.de>
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

ath11k_core_reconfigure_on_crash() unregisters the thermal cooling
devices of all radios, but ath11k_thermal_register() returns early once
ATH11K_FLAG_REGISTERED is set, so the recovery never registers them
again. After the first recovery the cooling devices and the phy's
cooling_device link are gone, and ar->thermal.cdev still points to the
freed cooling device.

The next ath11k_thermal_unregister(), from the second recovery or from
driver removal, passes that pointer to
thermal_cooling_device_unregister(). With CONFIG_THERMAL_DEBUGFS,
thermal_debug_cdev_remove() takes cdev->lock in the freed object. Without
it, thermal_cooling_device_exit() only compares the pointer with the
registered cooling devices, so it unregisters a cooling device that was
registered since and allocated at the same address.

Since ath11k_thermal_register() is a no-op during recovery, the cooling
devices stay registered like the radios: do not unregister them in
ath11k_core_reconfigure_on_crash(), and unwind them in
ath11k_core_pdev_create() only when this call registered them. Their
callbacks do not reach the firmware while it restarts:
ath11k_thermal_set_throttling() and ath11k_thermal_show_temp() return
early unless the radio is in ATH11K_STATE_ON.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Fixes: 50556081e09b ("wifi: ath11k: thermal: don't try to register multiple times")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v3: new.

 drivers/net/wireless/ath/ath11k/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 0795ba7e038c..4aaac5200ed2 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -2072,7 +2072,8 @@ static int ath11k_core_pdev_create(struct ath11k_base *ab)
 err_spectral_unregister:
 	ath11k_spectral_deinit(ab);
 err_thermal_unregister:
-	ath11k_thermal_unregister(ab);
+	if (!test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags))
+		ath11k_thermal_unregister(ab);
 err_mac_unregister:
 	if (!test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags))
 		ath11k_mac_unregister(ab);
@@ -2342,7 +2343,6 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
 	mutex_lock(&ab->core_lock);
 	ath11k_hif_irq_disable(ab);
 	ath11k_hif_ce_irq_disable(ab);
-	ath11k_thermal_unregister(ab);
 	ath11k_dp_pdev_free(ab);
 	ath11k_cfr_deinit(ab);
 	ath11k_spectral_deinit(ab);
-- 
2.53.0

