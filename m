Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302474;
	b=WDBcgFDm1jzkJSF6N8C5vI3aoSg5AWRkCGv2EqXXJylVroHNMNmFvGi3powGYrIIBrgI
	 vh1WTkXb2NhYWYrI6Tr5QWDFB/dVqM4txrBv+ez/aRQ7xtrCapq+84s1DP3LYvn4ouBpU
	 xW2zS7vsuQeNGbnAIweL2fh3XdFhMQlV6EPS3u8l/qQmawnX396g3O2+TezmjPYCpjCNK
	 c5rGXEqmy+cuI9I5CbLz2FMHdg6RmNAy26W528E+oefFJTgPvw4IOzSlJ+a7u/zEFtUjh
	 ID58oeEcugEuph7NB8GDKNN5U2sRZxYAvGOMg1WBAlFJIzuX89hzK64/KEXQX+g020Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=70WNgqL5GZRExFkcGtbsYLJh4cOMmVFtlMmJCmnLrEM=;
	b=q3yhJ6szZBIPLB3NE816ZljfLuw2d8vXZUZiv8YHP6UEmTuNxb+7cJ48S0aaFEGSo9MZ
	 EFQn+06dlTAFfwpzHnFdYvknNDdwfC5WOoyfPVphSMNzgK5N+hrHrflPB99akJD0fSxzf
	 QUxax3S4UntHCq/MaDDA1jFa7w9vTIRNwVRIKful4Qkylqpd/LasxMir0Q86RHkzUD5Tp
	 7CKtNf0p61Wgdxb/rgyvK/l972C/m3abuzQ0wch3u13hjDfA/4wJp4E2LslCd18pczJK4
	 0OEC+IvvN3LU7Biu56Pr/6w+sLulH4mUnMkA70B+/i7ZU4cx+dCb5QKVCJq0NPdSJFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b="iAn/gKCe";
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E54C60A3803
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 23:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E54C60A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=iAn/gKCe
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so391308566b.2
        for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 15:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795302472; x=1795907272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=70WNgqL5GZRExFkcGtbsYLJh4cOMmVFtlMmJCmnLrEM=;
        b=iAn/gKCeDVxoppGDtERRfbQtMG3UyulV8/ug+KryZz+U+gatkxGk/JS19etoExrH2k
         AQDxCI1HLDqRdvHjeTjkJcwJnA/EC9FBoQ+J04FXLfTGwjnIrW6hMev3wb3CFzIIDd8N
         LSfHhbvgmEAdprpqNr4KUJFCCL4gjwqobaNVo5RKM8ppN1ru9ZI2afW/1XWVGu8EJUGV
         3ZK/Z7DNajvIBLzox6xzSvxQc6RrYW1PxER/wpwslJmmaAn+DI5sxDD7RjPBUFBmvhSb
         RPuAACm4PImYIPWTSquQPsmGxBfcFdsFfwpR3jnWEV2VwAF9THfKW0fTfUAp4hjNcjB7
         5PCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795302472; x=1795907272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=70WNgqL5GZRExFkcGtbsYLJh4cOMmVFtlMmJCmnLrEM=;
        b=mjCubM21ds4n+/3uiLKv1u3wsqAi09qX4mhiZcMEle+qCG3Ez0JOnAwBLncX55EJUQ
         hk7ZQ925jpxf7brNTxvIhwcoDIofHqrB6uPwGohxCKp7HhOYVO2DvlLt4ZWfV9bzfBHC
         FPSxTUkaB8d2/xmVFH92h22+iosh30V47AglPPSnOpj3P+TmFAnnbLuVh7+OD98TkfxS
         AIwyJICmQV52WCZ5rRSMUVQziPCzJLTSywcs1z7rJZc3f10GvZhZwTfp+74JDf39Nwd4
         QEbNKIaPVQKL9wOKwebSdoWU6OyNl+bXsnNC3uvfzH2zBWCYWUyrSTZNfhjCC3Ce5Jmo
         D/kg==
X-Forwarded-Encrypted: i=1; AL+hErHOA9PnBY/mGcuiNHrm09VbtBP361mIJo+HG5L4164DF2rvZHiNgAi46/AZfAjpuN+7IB+jVCGUgtKfviHS9w==@vger.kernel.org
X-Gm-Message-State: APuU4Z9RCqHxx4o4A5w8EPKOFuxWDHcu7s3QdFqr2zTp/jgs5MpPcYiz
	UBnExtO9ROYLmQPvo2xg3SxdDFpAH9pOLZndx1JoOYfNbweMW0IRzn1KT6fDbBkwug==
X-Gm-Gg: AZFdTZcTDGV2arAAGVQ5wM/U3Ox202RKtRYD1NQZCq8cLfZ/ZZuB4xsNfI1uG4tauzC
	bD2ILd/e6a9L6PDIRLh1ghIi+jKAyQTtTPASNlHXXV8h89dcqT7kFMrwSO96R9YwUyDQFOt503/
	26Xa78uiOQvjbUfJO1rQuStJdfoAZq7TQNPkRl7g6iZcSuo4YYo8JBlLpTcZTiBFMM31cR36cmK
	D6sgI04gxeEQzAshP8htff9cQPLxz39/Pw0rLFKsjOyvtqzeSa7N5vbDBtDrvnjWtmGr4w6p3EJ
	De7+tdKMhGH4QYgIKo8PnsBVAh9EhfdFms3+iAStD+xlvrpSfIc7qWH9c+J3mj5vHGPOpSMw3sC
	qpDYYye8t2njtMxHdmUcvPIWNLFVFNftVmBvRSqKiPzL2OIGglRn/+Dn9b8AnESPNu5PgHQCB1Q
	GiHH9RsSl5hdl/Y2Me7dr7cP0mVzAcPRAO6e5S+O9yhYYiaGgdKghCEUfkagtBSD9/4+eQqnzQe
	1KhbcN2EYpL9HstPoK9D3hvYz4xUkpJiChOnc0tNyb9BKcEne5kLH8mhhPIsDq+wF2q7TvVpOk5
	1j0E8lY78YSsdCChsrChdjWrhS/7t7wtr5C+Nn9n2CJ9YVoPa4K/XVdVqWBk6CcBxlquq6YbOso
	s8YFvCgpu8Ta9EweOULH4OtBaVYncCvFxbr1AvyQ4FCDKJGd7eIuBtl48Q4IufBKfASvpZzRhBp
	Q4XmxBcSBrnizme1mjRlUP+lyOo5bwzX2CWb5l9Cd4I6d3lZgGAaQeOR+DZIsNQN0gHjM/r5bOP
	TlNE1bc87s2BQ8sJLMGeWjN4uRGaIuUStXPFJZkHCSvhVSs0T5iEp+lvT/R0ZADEScjW1ig6mpS
	UrNIpmeKQFbM/grm3dBQDv5PZ+wsc130toBNHywgkvi8BIuXmV+JTbENak90CdQNWRyZnz9FGXU
	=
X-Received: by 2002:a17:907:1396:b0:c48:a838:c16d with SMTP id a640c23a62f3a-c513ab4925bmr425452666b.30.1795302471991;
        Sat, 21 Nov 2026 15:07:51 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470edf0034412c7e8f5a5e7a.dip0.t-ipconnect.de. [2003:f2:470e:df00:3441:2c7e:8f5a:5e7a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc1b40sm242721466b.54.2026.11.21.15.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 15:07:50 -0800 (PST)
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
Subject: [PATCH ath-next v3 10/13] wifi: ath11k: ahb: configure the IRQs before the firmware is booted
Date: Sun, 22 Nov 2026 00:07:28 +0100
Message-ID: <20261121230731.1206043-11-julius@bairaktaris.de>
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

ath11k_ahb_probe() calls ath11k_ahb_config_irq() after ath11k_core_init(),
which has already initialised the QMI client, created the debugfs
directory, registered the PM notifier and booted the remote processor.
When the IRQ configuration fails, the error path only unregisters the
SSR notifier and frees the CE pipes and the resources below them, then
frees ab: the firmware keeps running and the QMI client, whose callbacks
post events into ab->qmi, the debugfs files and the PM notifier stay
behind.

The order was swapped by commit 166e22b38aa3 ("ath11k: ahb: call
ath11k_core_init() before irq configuration") because the ext IRQ setup
needs hw_params.max_radios. hw_params is now set in
ath11k_core_pre_init(), which ath11k_ahb_probe() calls before it maps
the resources, so configure the IRQs before ath11k_core_init() again,
as ath11k_pci_probe() does, and free them when ath11k_core_init() fails.
Nothing can fail after the firmware is booted then. The SSR notifier is
now registered after the IRQ setup, which it disables on a shutdown, and
unregistered in the new err_free_irq path.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Fixes: 166e22b38aa3 ("ath11k: ahb: call ath11k_core_init() before irq configuration")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v3: new.

 drivers/net/wireless/ath/ath11k/ahb.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 893a3270394e..736fd368f8c6 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -1285,26 +1285,29 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_ce_free;
 
-	ath11k_ahb_register_ssr_notifier(ab);
-
-	ret = ath11k_core_init(ab);
+	ret = ath11k_ahb_config_irq(ab);
 	if (ret) {
-		ath11k_err(ab, "failed to init core: %d\n", ret);
+		ath11k_err(ab, "failed to configure irq: %d\n", ret);
 		goto err_ce_free;
 	}
 
-	ret = ath11k_ahb_config_irq(ab);
+	ath11k_ahb_register_ssr_notifier(ab);
+
+	ret = ath11k_core_init(ab);
 	if (ret) {
-		ath11k_err(ab, "failed to configure irq: %d\n", ret);
-		goto err_ce_free;
+		ath11k_err(ab, "failed to init core: %d\n", ret);
+		goto err_free_irq;
 	}
 
 	ath11k_qmi_fwreset_from_cold_boot(ab);
 
 	return 0;
 
-err_ce_free:
+err_free_irq:
 	ath11k_ahb_unregister_ssr_notifier(ab);
+	ath11k_ahb_free_irq(ab);
+
+err_ce_free:
 	ath11k_ce_free_pipes(ab);
 
 err_hal_srng_deinit:
-- 
2.53.0

