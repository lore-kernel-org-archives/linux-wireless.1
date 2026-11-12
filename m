Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482794;
	b=gR3qXYOlRw1gONNPYxnS485ynIfuJkCQLNTpkh3k0IWla4r3pxftLfhrr0ijw64XZpMR
	 NBccbK9UDny8aoni6P/7EgSvnPWV/PRnuo/EX9Pbi/+Yin38solU3b9a2G/9OSJaEvcNS
	 bD927fHrwc25OqVmk4aVzAK3assc1vMvyAc8NfhSP1PeGKOn3Inbf2HRf+E5EKWEwBK1Z
	 dFOYN1SKCBeFc1lTSCJg/0jAB9yP3GwSskd5E8Iz5x7QoOzfsKSFGHNtJVf1TYhdkRHAa
	 yyHrnij+RMJNPUzl0z4UEmMa3pFXPxTm3wnKZiEiB1oW/O1iZ1kHFWsXE+GT+EuKHUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482794;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=el2CQuyn3pQhfXRvL5ji5Th3JnhKYPAJEFvX5LDKFb8=;
	b=xBGqrmLJ+KOhvjY2UvTGmczL8Re9UD58Ma0k+V3QeQNRHKrB6YCZPHZ48lFOnb/HR0Ng
	 JM3kEl5KpZsSHAE/sCuP7Mu1I+SzslicURZ50BXoZ4biwzu6MjobWHDcqcPR2s4zy0BmJ
	 RoITOZbI7U/wPHpmtU8VFiF60Pd11VtUBLdTg9A0gh8stsw/nNjCo3MY9Mj8I3RQJRP8w
	 zFZxnuNyFX+8AaXluEXI/bzXaoUWw/xXe5yrp+z4WMY5WNTp8BzByYWh/6lLfpRtvcq5w
	 00yTl+XVUKMcfQAl4x2QLIMI9pHl8qmn1H9cQv1CkR7eNi+2g3fiU9px1nYQuN//G8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ky790TIC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MSDHyj3G;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19660606C156
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 11:26:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19660606C156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ky790TIC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MSDHyj3G
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC93xxL2514179
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 11:26:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	el2CQuyn3pQhfXRvL5ji5Th3JnhKYPAJEFvX5LDKFb8=; b=Ky790TICLPa5wO0n
	zd/ylqFL7cFNXHqtZYU6fD792bV8DN8I4lHhjee0DX/yBJPhH3SqqkaBm0ns2fNe
	vdRjhjL8sW3hd7Ve+C+N+USbQhgBBjZkI2YA/5Wm+dYRW6OMtVZHYn7boJIm50GB
	fMceUMm1hTdPfm1OiUK+NFuuWD7pzNQHC5dOuc1LppvDy1FYcMJU6yZtrI4oETGm
	9Ehy4hUFqHAOO7zJaOGA0+IOIgmsMTXMx05gMjF7V0CmHMjnTdRNGohcxBxpiCwx
	zhF2kiIHxd1u7fYI4n4K9hhGZW90qVKyyP0eTaASMkLyrHhJa4rGxv8pWlvda8jj
	b+sjpA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvwm1uavv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 11:26:32 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so7984674eec.1
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 03:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794482792; x=1795087592; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=el2CQuyn3pQhfXRvL5ji5Th3JnhKYPAJEFvX5LDKFb8=;
        b=MSDHyj3Gv2GvdYO2xHQu6mLzbeCU8HJSY4Zcm3FcdutlSAIO/4Hm1E8MjFqVf1e7GL
         Jv3CrTgI3PJNolLwDh1TFqaYEAXhLfzgPCkcFDptDqrhAnqmWUj+V8ScCXzMvul9pLgf
         Si8vKSrw2l92P1czY452leLkoQevHbLTt7832yWQTssEKCZ/p0+RG/ssh8gPV2j4FmfJ
         r92eYXvOh0F0QxIGhC8c4uc6/umMi3BfgceDckU7n3i1Zv0/nNA9lhwTmUv1g7bCluUZ
         E+fc8kpm+VyyOBXwU/3TSgbrND4N28GEuFhY6ZtwtXa6yQZc4isGlUI9xac3C93FFa3s
         bO8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794482792; x=1795087592;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=el2CQuyn3pQhfXRvL5ji5Th3JnhKYPAJEFvX5LDKFb8=;
        b=AEJeRpLstTvFtUFcy3j3tt3ca7CPnVseLg9HxWlIVqnF+GPh6rLXCKQoAMWzf4Y9B4
         2E/t4d3OwCQQKv6fReBJH/1vyW/OQOWqov4scOvNwvvalbn6asiAa5Rn9cjfBSJiafU9
         tqqbkyuB+/tRmrhMVlamMSRhIKw/74T/EDbxdGY18UY56n7CY4hccYd9T7FaSys7ukDJ
         Y9f4Ph71LzukFIbckRXOCwbg/cKgzxipsmV/bLm9dqyy/EZOWGaleTdQc+RxsDCJ0p1a
         8zEqaaL7i5L/zYUTT7swALKvgNB9MEv8s0ohdi0q4Ns5K0h4b3CWwM7m5RXiDwJEqoXe
         D2YQ==
X-Forwarded-Encrypted: i=1; AL+hErFl/tUxLCWgauyh7Jge5QhWtHJP0KRHUIFt0Fdv/vMr5umM97QuyqYKPpAVwtH6NB1I3YyWFtnHhBZAwVIOvQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9f+dOXhcvifbKCMYW5FKyKP6ie+qbjHCO3fjfIJRpa1K2bvuja
	yJbs3Yl1VSfmcFKrScIA2lDjDKMF/XUOulyOhepCY3K3HfArO79LpnbDWSWn0RAaMO8lrNhDIrQ
	ePA3qD3V8orvczq1Z99/etuBxS80A4ltPLyU6kKo3eiRXco1vnororo2RAWBthvzsdwZqth2Xiz
	HXXlTWwlY=
X-Gm-Gg: AYBFou3m3ym/xAwKJdbST585mqyUdkSJ9qt0RL5dtYCVeH8/eENI0UQGC9AqwN1K6LQ
	Oev5pXd/GpKBlMe1zYR/Hki6TZdtf0zn5yPpKGNB9uOp/J+Eg82yN0MxftDte3hS6jzOwdGbsMh
	bljiUhU+7ktHn6Us/CRccCyDshI6kMBwil5sHHj1VVxrFnd3Zs7Y/0dzDXWcSSMv9Zq3210pRJ1
	BnZd8u/NKfeoI3c6MSraxTQFU0TL3MoRtSrsJfPeivwFGLj2HEhmKFFqNNqrKad+PpxNhM10b6a
	VY5M4LLSOLM+RedAihk642CkCdgevRSIaT4fFHGHOXTLd37yJ5kaKZsX9pU9a+4O6FObQc4c6/7
	Q/6wFlujMWYjSuZze5fMd967Y+QD1CkooZGOjWaniWxGF3QGcXi9YSg8o1f0qWHAJy5COinYpP9
	OuWRhPgrEEUahbcCA6YDkrHp8d
X-Received: by 2002:a05:7300:f3cd:b0:369:1401:c5c2 with SMTP id 5a478bee46e88-3768675d71bmr5153708eec.26.1794482791837;
        Thu, 12 Nov 2026 03:26:31 -0800 (PST)
X-Received: by 2002:a05:7300:f3cd:b0:369:1401:c5c2 with SMTP id 5a478bee46e88-3768675d71bmr5153682eec.26.1794482791222;
        Thu, 12 Nov 2026 03:26:31 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm30402359eec.19.2026.11.12.03.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:26:30 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 03:26:01 -0800
Subject: [PATCH ath-next v3 02/10] wifi: ath10k: wake blocked waiters when
 entering WEDGED state
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
Message-Id: <20261112-10k-sdio-crash-v3-2-24f03f300bb2@oss.qualcomm.com>
References: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
In-Reply-To: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794482788; l=4066;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=WdXy73ueVmpONtOum+Ij/PkAOeZy/dAa9fvCK9SxjuM=;
 b=fwfA3kI+S8TKbq8zCOla0+nWrmNWS3cDFKROXDGAfpaIBgZ1u3N5Ihz8qLsh67mXQW7ayasZi
 +frthQUAjmQCzPdjofZ8fp4VJu+gkR6leeLEYKd3WMpfcyhMYCPSqPs
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Authority-Analysis: v=2.4 cv=KsnYSmWN c=1 sm=1 tr=0 ts=6af5a268 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=6QK6Bl5UZFK8huMW9Y4A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: v-dGV_xHPd3-mbGBeGJYj3SjzGsjLW3g
X-Proofpoint-ORIG-GUID: v-dGV_xHPd3-mbGBeGJYj3SjzGsjLW3g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfXx8d0Qei1Mhzw
 u6VP32eprwwPUdZO0cGvTNtHxhoAdPes1H8vHODAEGtp/pD6E9Le9mMqN6bHrL/cxt8BWxe01hX
 H0MKmZxra1tjcgX3NwVvCWY8v5HemCypsJ+Q9H2gAaJwG35PaDP4oPgbY4bsyX2KkrZ0/3OHdH3
 dkrMy1OVXE9igFnfumhODvMoZdOKPD33pyUnHnrMEF+/QLv+NWV+2zne2bVw/ccusQdGf38X+jq
 YuLPjbay40q8vrV/WfDbxx/gGYIJzrtiT8LBdYHuums/Ejw+tYdUPApPWmtMv3QyvHHdPSnjG/k
 UqEAY7tfab2x3x9cwJJXn6lqft3BFdNnksXtv5Z9LZHBRAFI23RrMW493Tg2JlmHhZrIuFuX+PE
 pzRp5nuDnqjbjDjX9TeWpjalxWTpK6iSmknrJmbkcOYoPIl8Xk0bFf8POBkRW1KltxgAFSCZf4w
 Iey/98cP2nNQ8bgZY2A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfX6S8cL4zOcphQ
 LusiIjI/V4fTP5EbfizKAxdAsCZJZ43m0HYXxipq2yf8NfBhXGNUpTV90Xwv8zoQk62vL//vOW5
 s7vEuouwYtAvr0uWED9GUaJL9o/n+sE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120045

Commit c256a94d1b1b ("wifi: ath10k: shutdown driver when
hardware is unreliable") added a fail-count based transition
to ATH10K_STATE_WEDGED after repeated recovery failures.

When recovery starts, ath10k_core_restart() sets
ATH10K_FLAG_CRASH_FLUSH and wakes waiters already blocked at
the time the failure is detected. However, additional waits
may be created later while the recovery attempt is still in
progress.

If recovery ultimately fails and the device transitions to
ATH10K_STATE_WEDGED, those later waiters continue sleeping
until their individual timeouts expire even though no further
progress is possible.

On suspend/resume, these extra wait timeouts consume watchdog
budget. Crash logs show cases where one or two such timeouts
are enough to cause the suspend watchdog to fire before the
driver finishes shutting down.

Apply the same CRASH_FLUSH, queue-stop and waiter wakeup
handling when entering ATH10K_STATE_WEDGED so blocked callers
fail immediately once the driver gives up.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Fixes: c256a94d1b1b ("wifi: ath10k: shutdown driver when hardware is unreliable")
Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 43 +++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 82bb0bb72dc7..e32bacf5b771 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2491,6 +2491,32 @@ static int ath10k_init_hw_params(struct ath10k *ar)
 	return 0;
 }
 
+static void ath10k_core_wake_all_waiters(struct ath10k *ar)
+{
+	complete(&ar->scan.started);
+	complete(&ar->scan.completed);
+	complete(&ar->scan.on_channel);
+	complete(&ar->offchan_tx_completed);
+	complete(&ar->install_key_done);
+	complete(&ar->vdev_setup_done);
+	complete(&ar->vdev_delete_done);
+	complete(&ar->thermal.wmi_sync);
+	complete(&ar->bss_survey_done);
+	wake_up(&ar->htt.empty_tx_wq);
+	wake_up(&ar->wmi.tx_credits_wq);
+	wake_up(&ar->peer_mapping_wq);
+}
+
+static void ath10k_core_enter_wedged(struct ath10k *ar)
+{
+	ar->state = ATH10K_STATE_WEDGED;
+
+	set_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags);
+
+	ieee80211_stop_queues(ar->hw);
+	ath10k_core_wake_all_waiters(ar);
+}
+
 static void ath10k_core_recovery_check_work(struct work_struct *work)
 {
 	struct ath10k *ar = container_of(work, struct ath10k,
@@ -2513,7 +2539,7 @@ static void ath10k_core_recovery_check_work(struct work_struct *work)
 	if (fail_count >= ATH10K_RECOVERY_MAX_FAIL_COUNT) {
 		ath10k_err(ar, "consecutive fail %d times, will shutdown driver!",
 			   fail_count);
-		ar->state = ATH10K_STATE_WEDGED;
+		ath10k_core_enter_wedged(ar);
 		return;
 	}
 
@@ -2585,18 +2611,7 @@ static void ath10k_core_restart(struct work_struct *work)
 
 	ieee80211_stop_queues(ar->hw);
 	ath10k_drain_tx(ar);
-	complete(&ar->scan.started);
-	complete(&ar->scan.completed);
-	complete(&ar->scan.on_channel);
-	complete(&ar->offchan_tx_completed);
-	complete(&ar->install_key_done);
-	complete(&ar->vdev_setup_done);
-	complete(&ar->vdev_delete_done);
-	complete(&ar->thermal.wmi_sync);
-	complete(&ar->bss_survey_done);
-	wake_up(&ar->htt.empty_tx_wq);
-	wake_up(&ar->wmi.tx_credits_wq);
-	wake_up(&ar->peer_mapping_wq);
+	ath10k_core_wake_all_waiters(ar);
 
 	/* TODO: We can have one instance of cancelling coverage_class_work by
 	 * moving it to ath10k_halt(), so that both stop() and restart() would
@@ -2624,7 +2639,7 @@ static void ath10k_core_restart(struct work_struct *work)
 		/* hw restart might be requested from multiple places */
 		break;
 	case ATH10K_STATE_RESTARTED:
-		ar->state = ATH10K_STATE_WEDGED;
+		ath10k_core_enter_wedged(ar);
 		fallthrough;
 	case ATH10K_STATE_WEDGED:
 		ath10k_warn(ar, "device is wedged, will not restart\n");

-- 
2.34.1

