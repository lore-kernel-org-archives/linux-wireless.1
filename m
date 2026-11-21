Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302462;
	b=mxnOJknuvOGBIZA1uOHfWAnOFidNdS2oYTL1p1+bG/S/eFTESKY8ulJySsr/miJGj9pF
	 +V4forkszCnyW8OyD7mN2NV3QyL3dVZR27YNJh0cbioVRc6crmzOHscry/1gbv+NbF1tV
	 43TAVJcUr4sJf3taOPiLJkMTyjenn1uBdHiexus6aAxXPLHehC92Z77mKOD4zK5w5djN5
	 /0ZZblKmr+LZhFBDzpdecNvq7PpBZdan06nCsvZrlHUeYXOXiqMjn1lC2fReOJUHPoqqB
	 mxXO4GsBNZ6lpkMWUgPzYc4DwaWNCFL/0q2V+RbBHHxrgxxIe6FUpx2NbkdbC4luz3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RzF4XgzG+OFQFl38cVbBCWJ0+gCFYYh6ZK+opbkd1ps=;
	b=Mpve8LCPlJ471Ek/0Jp62sqLBUTwdRtInOYFaDTWlQfdTNeUVfQTg5DIt5cM1Ys0pBlu
	 nHswb6dygDmEHqx6Fps4hTdPpS1JYwtCEI6Jn6u8SVN5N7G1tRgskFd0zdukqVQjJl58S
	 DqVg5OvjHeUCRx+ao/f+or/qTm5Ga2g555b0VbRwB9C8fmh9+nLGdwDR64s1OS4SOawdf
	 HAoo0S5PifPMLKkjiZzeC7rcE0vRSdLvhVzw/kZwzO0OhkGE8AcL4MlSL8tEBwpjxGWhy
	 C1/fQ2+5D0r86roNEtNNQztvTX5p8lgO6zD50/PClrV73Yp8Wbm8bwzSdH5WMsYdY0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=perZYWZG;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E42606A688
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 23:07:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82E42606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=perZYWZG
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c247f6687dcso317403966b.2
        for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 15:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795302461; x=1795907261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RzF4XgzG+OFQFl38cVbBCWJ0+gCFYYh6ZK+opbkd1ps=;
        b=perZYWZGTcIuDNxZ1nNcXbkGt1MfSRoIGXrDThH6wtSW1YycsyCGWdVYa+8OuBNXO6
         ByG7Yz1v6eqxlhboGR+icRKs0jVlLpigyx6mYblj2e9H3NWI6bTyM7mAMa//h1PbvvqN
         qbdp8HCTVlfjOYtvRI7owdNEzwYziZUVpRt4bLhY+hrcUIqUl6wov4QxDpDOOIl6j6+U
         WYYXYWCtDJc5+IibQH7Y0li79LmE+YD62U6UiWoeKUUCgvcMXX+WbJ+d2qVAieGmPTKb
         ButlWGnvBQD02CRn72fKLE3d+3CT9ArjqFmVNGuWUzQDYYE3ZHSowxpPVCUXd6mXEvwm
         J7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795302461; x=1795907261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RzF4XgzG+OFQFl38cVbBCWJ0+gCFYYh6ZK+opbkd1ps=;
        b=h3gU4QeDsyAjX97NoHJ15Zn2fp4Ifqp9zj/yYJ4EPSghJQEN3i+Y8DJMPwv2YbYJ6G
         uFkGS/Oum+3XN4422OZmKEiANWZYvUMTmHH4NH7ZCkHIQ4UEsXgHywP5wyl9Kk3yn2KM
         1F/xpu8ORTXNKcD/8WVgMhiIHkPVxuz4wnmVlVjelJus0mFbpw/kGxLqGSSmLy3Cf6/v
         prw1tTQAbdpwrAk44+ktpIhdEEAJf6Ko7DwPbRkSfqCNTChTy3Za1QsrLZs4zpxjicde
         327nz8z2Go8oNgWTGKv2rF2p5MzGCho1XzUQmbooI6AHjhSdZ9IiUtvQzjodNfe+XHrU
         0kyg==
X-Forwarded-Encrypted: i=1; AL+hErFaLPR/q46gEzXBG80x1A5Ux+Emi2ykbQO/f6f+suXHUs6PJS30QMfw6Mu8TqF0O3U5hWRxMJNQf4Bvnba3qw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9yw/f/vRDylvDxawUxWw343hyGmSsqd3IF6g1Z/XPeZTsZMwoP
	FvZBi1ZJzRi/495i9stV/tXdFOD4p/Yzx0Fl4zlMTeyoenaX7nK05a0AwAIgOubdiQ==
X-Gm-Gg: AZFdTZeUyuaXDCSlPUylfU74VpFMZZsI0nt13ul8UhgXBz1iU+HXxcQyjx5ZAXEfEXX
	u2+okV7uKfh0lch/ZOqPOKyYrYpuryV/xfkffFe4kbyasWMqaLeYk0AFohbVEdJsqtCArt0duY5
	/YzEDtFwA6Z8259vf+fuFTBtMoX+i/WfbGnC02X4MnSfN3ZSnY0IChUAEg+2wC4LM+9NPJyP1tl
	bGOhSsjQw6IBiElisLCDWDwCSUEh/VfQ1cqGbcU4uftR/bb35IgnHXwNME6XIs7gVmxJl+g1+iE
	OeisgrKocG9BRzsxRg3eTyE2AK2PTSs7TDdG18WlGHMqE0q1AfMv60JIoVF7Evy6LvX7fyUfOmC
	/0wSrMcqYhJn16pnXNfPlxUR2tOOQlKmf1Io+2fUFYRDBLSJlem6qveGPLb8BbJeVwzbAMsCxER
	qcaGUVlUtsc/evbZyhj1+lUTEFQBk8hYmlb0X7Gm+DhR+T1QDyJ8yrkkaS5KrQdla8KEbzkUeQl
	cgYJNiTlK6mChNZRpY4UhutpuLCeJlZ2NnmJgTuIeyRxtsnewyNvjb+HmXetgeRkQE9vO7FSnxD
	48omNA3P0qThTNc8xTuAZf3wUwk0/M/rfQJFDvsvTRDdca8UGbUNyWSMRNEE9MQzYaUsoIuH/Ft
	LkPEuqvIhu7heqa+Pw2KKselqO+CglNjlsUcoQnQPv3cauJOF/ahl2QpBiSw3gpivJo+NqHuy0j
	PR6+Qc0NsWdzG7WGDdw7UARAuQoDRLsxwnH0pWUhtIBdvSWCprCgKt5CKd0De5AVWgURsDxFOck
	CYqRK+mmuPeCfZ9G374Al4lrh4gmQBAYnc6W2IZ7SGKjHRD2M/EUPr+GaOuXrgs3VqNytyoDi75
	YT3A0IcfnqNRucnn5HRvRUZqJpcTW+HNF9WYyBPm47wvmStJl34MMFMv1XXI80JXzx8gjFCP4Jc
	=
X-Received: by 2002:a17:906:4750:b0:c3f:dce3:20d5 with SMTP id a640c23a62f3a-c513a88a462mr502393666b.22.1795302460965;
        Sat, 21 Nov 2026 15:07:40 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470edf0034412c7e8f5a5e7a.dip0.t-ipconnect.de. [2003:f2:470e:df00:3441:2c7e:8f5a:5e7a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc1b40sm242721466b.54.2026.11.21.15.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 15:07:39 -0800 (PST)
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
Subject: [PATCH ath-next v3 04/13] wifi: ath11k: clear CRASH_FLUSH only after recovery rebuilds the rings
Date: Sun, 22 Nov 2026 00:07:22 +0100
Message-ID: <20261121230731.1206043-5-julius@bairaktaris.de>
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

ath11k_core_reconfigure_on_crash() clears ATH11K_FLAG_CRASH_FLUSH right
after ath11k_hal_srng_clear() zeroes the rings, but
ath11k_ce_init_pipes() and ath11k_dp_alloc() rebuild them only later. A
WMI command sent in between passes the CRASH_FLUSH check in
ath11k_ce_send() and dereferences the NULL tail pointer of the cleared
ring:

  Unable to handle kernel read from unreadable memory at virtual address 0
  pc : ath11k_hal_srng_access_begin+0xc/0x60 [ath11k]
  lr : ath11k_ce_send+0x114/0x350 [ath11k]
  Call trace:
   ath11k_hal_srng_access_begin+0xc/0x60 [ath11k] (P)
   ath11k_htc_send+0x188/0x3c8 [ath11k]
   ath11k_wmi_cmd_send+0xc8/0x2f4 [ath11k]
   ath11k_wmi_send_peer_create_cmd+0x78/0xe0 [ath11k]
   ath11k_peer_create+0x138/0x500 [ath11k]

Clear the flag once the rings are rebuilt, before ath11k_core_start()
sends the first HTC message.

If ath11k_core_start() or ath11k_core_pdev_create() then fails, the error
path frees the data path rings with the flag clear. The stations stay in
ab->peers, so removing one later, or removing the driver, makes
ath11k_dp_tx_send_reo_cmd() write a REO command into the freed REO
command ring. Set the flag again before ath11k_dp_free().

On targets that do not restart the firmware after the cold boot
calibration, the QMI FW_READY handler clears the flag as well, also
during a recovery. FW_READY follows the firmware start, so it arrives
while the restart work is still rebuilding the rings. Clear the flag
there only on the first boot, before that handler starts the firmware
itself.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v3: set CRASH_FLUSH again before ath11k_dp_free() in the error path; clear it
in the FW_READY handler only on the first boot.

 drivers/net/wireless/ath/ath11k/core.c | 5 +++--
 drivers/net/wireless/ath/ath11k/qmi.c  | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index d6346e0ee047..7456a8422654 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -2298,6 +2298,8 @@ int ath11k_core_qmi_firmware_ready(struct ath11k_base *ab)
 		goto err_firmware_stop;
 	}
 
+	clear_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags);
+
 	if (ath11k_frame_mode == ATH11K_HW_TXRX_RAW)
 		set_bit(ATH11K_FLAG_RAW_MODE, &ab->dev_flags);
 
@@ -2323,6 +2325,7 @@ int ath11k_core_qmi_firmware_ready(struct ath11k_base *ab)
 	if (!test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags))
 		ath11k_mac_destroy(ab);
 err_dp_free:
+	set_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags);
 	ath11k_dp_free(ab);
 	mutex_unlock(&ab->core_lock);
 err_firmware_stop:
@@ -2354,8 +2357,6 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
 
 	ab->free_vdev_map = (1LL << (ab->num_radios * TARGET_NUM_VDEVS(ab))) - 1;
 
-	clear_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags);
-
 	ret = ath11k_core_qmi_firmware_ready(ab);
 	if (ret)
 		return ret;
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 7dc07339b957..a176e6498ec9 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -3291,10 +3291,10 @@ static void ath11k_qmi_driver_event_work(struct work_struct *work)
 			if (ab->hw_params.cbcal_restart_fw)
 				break;
 
-			clear_bit(ATH11K_FLAG_CRASH_FLUSH,
-				  &ab->dev_flags);
 			clear_bit(ATH11K_FLAG_RECOVERY, &ab->dev_flags);
 			if (!test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags)) {
+				clear_bit(ATH11K_FLAG_CRASH_FLUSH,
+					  &ab->dev_flags);
 				ret = ath11k_core_qmi_firmware_ready(ab);
 				if (ret) {
 					set_bit(ATH11K_FLAG_QMI_FAIL, &ab->dev_flags);
-- 
2.53.0

