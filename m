Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482797;
	b=kikJCh+jdxHMmfJf2hnFVrzig2+wUOT8ndJQkAckteMq2p1/vwVXIuHMpTQIKhdRExJY
	 BvNq3jaEAJTR8AyQW6JY54sh2prHQf4TW9/yEs0bX8H4DU8Udrm/6K31Kqr//IdY5Ef/o
	 cqArTj9o8CJpjlvq3fWkGBJr75ASs9jqmGe+BGBHTKpSBRxcl6FAy+tSWQM3y2qVN1fzq
	 k+jhoZbDSRkGmPKT8HqMYExgHMUIu3PRxVZbxO+vhDjd385Fa8zK5/ZUIV3zuC3laulTO
	 JvlMzYVAwG7chA5/03z9u3wBo/HLucBCHqJ3fzWg6kuFwcLko196yX5f1bw0Szegd7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482797;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=X7gmftng8XyC6y3KS/A/XtQM72Yig5hdROs/Yc4m/MI=;
	b=mocj4eFZILF7GHowLfWC3ROspQLnQAEi/ufwPLoTWeCvX6xIkmn4Q+/GjfAgvoMh/BCU
	 WqsAG3kor49/lYxwUB420mCjCAopgv3Jsfjtl8KPfUoe37FSyHJZbdVpnlUh2Jll7EHJk
	 hoxj5FzJuyxWrlbb7iH3z2LVO6rTtRZ+kFF/x0hCGIt65zXDXzRB8rsbxdcagwIrZsEui
	 S+31OLjHVddzRPH9TXALp7yZP4eSDjdgLBkq9NiyV067Wc4N49xLafcMFlbXuKJ3RQqtN
	 REIslG8aE0vr0sTf9GffRRn807TKgaSk7BU8rQYGJEUdnuD0MCp6OS9UP0iO2zVl8vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KQS0jTXL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jym5NdYm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E1B60A2628
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 11:26:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69E1B60A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KQS0jTXL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jym5NdYm
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACAUWgp1629193
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 11:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X7gmftng8XyC6y3KS/A/XtQM72Yig5hdROs/Yc4m/MI=; b=KQS0jTXL9Q8UpSEF
	eFXu+ZdFKEImDCucQHkeBKEu5RZ+egnKyKyqkp+g48qLQU4cLqBIUuSb3+zGuhCs
	tzu+WPjsuRoYMGLdpSJbvRCPIg2dg6CeCUXxPWt2K/LI6cSGSxvAjZEwH67e7Uvh
	xNq6mxqRD8ykLj2cmPgLVSchTO34HpMvRtresAeng/KEsG1t0Jf1LyVni7Yr8jjK
	pxEi8CChQDE1DQMnmr9yKr5KsOanJaTSqjKsdQsnqCfWz+RCUEVHPOiy/JXUmcAk
	rsyoQaKyBYRrr2plb/KYs0nKZrk9dmUXmMgsiW5hOEsnu7BNxbOvmD90dsnUhIor
	KkrwMw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbs005m2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 11:26:36 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a3451ea93so5651901eec.1
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 03:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794482795; x=1795087595; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X7gmftng8XyC6y3KS/A/XtQM72Yig5hdROs/Yc4m/MI=;
        b=jym5NdYmSYFYSiNGj5LmCh7qokMJ54kku9JD5QLidtkTnAyvLPeO8hFQbG3eGTSomI
         VX6jF6WXZCgbgf/URnL5LFjFUmP96QhUmkp8pRMw1KSKXlvLALlH4XTROI2EKK9zHWZb
         L+XsLfOr6LEmOEumfDaoWBCMoqeKy/hwblfIBp8l7YrATS4fj1ecV5HrvLLb/qbHrRVF
         gFzcc4ZshdgyccUGWCuvIFcFn5RBLgIT54rCn4R6MP6EOKw+5VgrdV6vvHvuvcinpaPC
         iqzaVrJF/iEgiukrwCsehdjfM1HwdGS54PlWUEJ276n09S+FLi4OZtuqaywaEZoCNpHq
         16dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794482795; x=1795087595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X7gmftng8XyC6y3KS/A/XtQM72Yig5hdROs/Yc4m/MI=;
        b=ZH9TpAfvFU0y24T9fk5Vs8CPfLgKycU/M1VDOhVDfhAT3vbDoxzz3AIxtrRLgO3hfY
         OllKUkfNfAFpMRZnDjGLkAs1W8fnJNOjbhmVszIoQDv6m8Joe0bKq/rC5hJUK2tRssjE
         k9z5jJg34R42g/IumvrHTHJFdXtl2GB3bt3lj7IFmgQlkzfOG2DZZuV4L9Yc1UxX9xj6
         NEFN8dHw/+aYySX4S1kIWrZT281RdM/hxmhSHhHlnNJI2byMZTLUC41sss0vFpLS4Wnz
         XiAZ55N7EGBs5JeiRyKnqvE2tTULlEo6D51h8g3XivAY6E3iJkiqzc4sQGJqa80L+mBy
         3q/w==
X-Forwarded-Encrypted: i=1; AL+hErGGIgcBGcOa3I0TOuPFbsUWfKKuFhkFm2Qs2gGXMh+3/UoUlfsjSJjKDu4JWmu9D5qP3RRcEExR3dJySzU8BA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9I0bdFb09n4hAwPgf80mMkOTLw+r02gMjjGLNOMFJh7CTVpQJD
	7Go+86aJu93VGxKoLNYYZi1ep2Zvd3QfmN7hQW652gLqOGE85Sh5gwduY/6h+Mu8fLqLFfG1Dk1
	5Baayy/5qyLlDKuTeWhAkv6VvZ2BIMH1tnAtPEuVg41ZRdIoNBz6M95qMZqKvzb6e4nvAug==
X-Gm-Gg: AYBFou3OVn5JJRTrWJnP5ds3pXpYIJMU9AKXCJ3P27xs/Ry046Y29nxueVcezv138eq
	Td3azY0TpciOWb81LKfcquXf3enhGCNwOa44EOaXLoHlZEkI1G4g/5RRKO8mdochFEr0nY02pZi
	xheNGC0VEl9D/jBX1j2gV1R8kZJJpoc1VLR8evPIM0zLBcT1WYoktgldjfyACDKsOAVE6zmgCcW
	jXnsJkG9IpT9B3rhAUz49/rLjEmH5/aT4LS3fE/Pty4/ZZAPS9bJaw0vjf8k93UGmjSqteYS2ox
	0uCvFSSb7r3dmCprC1n32oa6BRM4S4RULWXE7tsKaEAO0zXuGA1S06MRcP7ylVWVBJKENHnDaLE
	15m14UiSOH6TlqJ2BhvRokmqpAPN1iCxxWYP54kQYmXZ5wmQkHEsYuXmdF+hiiKOyFKVLs1c/OY
	xKv1Ri8XdqzJiD4Ov//0qxUq1F
X-Received: by 2002:a05:7301:46a8:b0:370:121a:b2f with SMTP id 5a478bee46e88-376854b990emr5265321eec.11.1794482795244;
        Thu, 12 Nov 2026 03:26:35 -0800 (PST)
X-Received: by 2002:a05:7301:46a8:b0:370:121a:b2f with SMTP id 5a478bee46e88-376854b990emr5265302eec.11.1794482794723;
        Thu, 12 Nov 2026 03:26:34 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm30402359eec.19.2026.11.12.03.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:26:34 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 03:26:05 -0800
Subject: [PATCH ath-next v3 06/10] wifi: ath10k: remove now-unused
 driver_recovery completion
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-10k-sdio-crash-v3-6-24f03f300bb2@oss.qualcomm.com>
References: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
In-Reply-To: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794482788; l=3564;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=ILgt+FP56A73W3Zz3d3BGWuyYpSBYBnlRPrxfH+vH2U=;
 b=9NoNh2LHNQ5MSBo9KKKhlhG0+SPDNr5mQC7LhsAPd8fReXvDDGYhFLqeJXT/RozrplA0ICbmN
 ENdnFjZkFkuC/o2WQfX9eXjNx53k2BxAqFihVLxF+hK0ra8pxZosqY+
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfX/JUDMmFiyBlD
 aVRThWwkerKTQRZo84lW01dNpHuKamdnO/+qZDsbKdbU3zI2s3r1a09VeOpmUE/5sn70xjnDBFB
 ElegJuPAPm4AQ1IHlqILuy0t+IT/j8KL4HCoI1BSDitt3B1P8dCc9d/ptCyqZKdIy7f3TzIZeDx
 AlfAgAnOnxRImTcMwGz335Qb12ayA5NWnzCMA3XWqYer+LRutfY9/RCueZ3UFkD07mZoJsMJRSH
 ksiVypE50qbPKmeriV93v4s5np9IDeuw+54LPjR+QJjOcZPB8G7VpBd/wI26O8B3vWMFWv///we
 BN2XanI8qJj/fc49Qa40Jmk7nEEzB9Kaj3rBCrLk8qJzSX48wXGzkNwNLQmiEXAyok5dc+Hg9Zw
 N1g4JSYb219IGTPzALOvJ6N/stTb6RwHyYG3wcfeq6JMz3GDA2oKXGx1crYoKAdHb3viawU+IRD
 pmd8Nrvy7VYJwMvE89A==
X-Authority-Analysis: v=2.4 cv=AsF7T+9P c=1 sm=1 tr=0 ts=6af5a26c cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=M1ZKI_MSFVluud-aX2IA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfX4OVS+hfhOvVG
 EmHEjl5npuEuylvvWhhGLKjHVJEmV3jXjqRF+NNbYWiKmAVWOBWq4YJ7/S6Zzg4BqJ0uLh6FbUE
 E+26IJA5ZXMyPoxvSry6cvmLfAJkI8g=
X-Proofpoint-GUID: -OVGTRMdNtvkSEXEJwWBdHpFJikm-vgl
X-Proofpoint-ORIG-GUID: -OVGTRMdNtvkSEXEJwWBdHpFJikm-vgl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120045

The recovery monitor no longer waits on driver_recovery, leaving the
SNOC remove path as its only remaining user.

SNOC removal only needs to ensure that restart_work and
recovery_check_work have stopped before their resources are freed.
cancel_work_sync() and cancel_delayed_work_sync() already provide
that synchronization.

Use the work cancellation helpers in the SNOC remove path, then
remove the unused driver_recovery completion and its initialization
and completion calls.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 3 ---
 drivers/net/wireless/ath/ath10k/core.h | 1 -
 drivers/net/wireless/ath/ath10k/mac.c  | 1 -
 drivers/net/wireless/ath/ath10k/snoc.c | 8 ++++----
 4 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 4eb91efdba41..3be069724ddd 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2617,8 +2617,6 @@ static void ath10k_core_restart(struct work_struct *work)
 	struct ath10k *ar = container_of(work, struct ath10k, restart_work);
 	int ret;
 
-	reinit_completion(&ar->driver_recovery);
-
 	set_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags);
 
 	/* Place a barrier to make sure the compiler doesn't reorder
@@ -3716,7 +3714,6 @@ struct ath10k *ath10k_core_create(size_t priv_size, struct device *dev,
 	init_completion(&ar->scan.completed);
 	init_completion(&ar->scan.on_channel);
 	init_completion(&ar->target_suspend);
-	init_completion(&ar->driver_recovery);
 	init_completion(&ar->wow.wakeup_completed);
 
 	init_completion(&ar->install_key_done);
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index a1ded2cba103..7c961308d7b9 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -1067,7 +1067,6 @@ struct ath10k {
 	} hif;
 
 	struct completion target_suspend;
-	struct completion driver_recovery;
 
 	const struct ath10k_hw_regs *regs;
 	const struct ath10k_hw_ce_regs *hw_ce_regs;
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 6179a029914d..50eedc078c12 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -8185,7 +8185,6 @@ static void ath10k_reconfig_complete(struct ieee80211_hw *hw,
 		cancel_delayed_work_sync(&ar->recovery_check_work);
 
 		/* Clear recovery state. */
-		complete(&ar->driver_recovery);
 		atomic_set(&ar->fail_cont_count, 0);
 		atomic_set(&ar->pending_recovery, 0);
 
diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 8f171ab6f4de..1ec58ec1029b 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -1916,10 +1916,10 @@ static void ath10k_snoc_remove(struct platform_device *pdev)
 
 	ath10k_dbg(ar, ATH10K_DBG_SNOC, "snoc remove\n");
 
-	reinit_completion(&ar->driver_recovery);
-
-	if (test_bit(ATH10K_SNOC_FLAG_RECOVERY, &ar_snoc->flags))
-		wait_for_completion_timeout(&ar->driver_recovery, 3 * HZ);
+	if (test_bit(ATH10K_SNOC_FLAG_RECOVERY, &ar_snoc->flags)) {
+		cancel_work_sync(&ar->restart_work);
+		cancel_delayed_work_sync(&ar->recovery_check_work);
+	}
 
 	ath10k_snoc_free_resources(ar);
 }

-- 
2.34.1

