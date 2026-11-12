Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482792;
	b=p1aZIcCEq+vt9/zLAisRHpRVmLLZaEwdRt3lNrKvUZv9FwdauBkLzHBXJ9eRIiSxJhN2
	 2NmFBxCWdC4Hxrtt/LbwrhdSvFCi/4RMnXSpl+1+sFtyK+ghyOy4+sS3JoLdtP8wIW7XB
	 r0yseyrCMLjM58rcBlj+LVqZMfup8wkJfg5mXZevm/IKHMImtQSYvQCK6vyMAi+6HYdXy
	 7Nq/DoH0P2vWUS7AvHPcn7eLIuCZkbbF/c2f0AihHL0OTCLF7HLbtqGT3wcu11oZpsXvp
	 SleQ40I77zhI5znAREZ8OmBHsLue2UgRU4/lGP85HqIu7L9Gw1PBsM3BZkY5wi7LD0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482792;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9Vhj1ufJteMxS+0DSsfOoaW55CKmz9agnW/ULo4cVWc=;
	b=uWNlmKZBI5FnPy3YiZDU7DgvKnM9gng1rRFkKbc8h6jzdwAOVzycuCEC2BWL7ZuXqdVX
	 7GQ6K2tE5EuNV3ERJnEvF/Wpq2kSmTMaF4PU5TuSc8uLCjq5FYgFK6Zn+Ayi1OXGaADGs
	 4H/YScIgCSnlycGcMp6ndGgDs1xzp9L1BnpI6vMT8LYVHSIe7lKT60lSl7qZxnVfEw51f
	 h+ZigY4JcaLPONNz6XnKdvMc9BxnDY1ASArc+pRhgwZfvNwvCyFqRCEqNWESUlGDxj0WL
	 nz4BEl1xG5WAtztQFnj4F0cMlajwwHPZlELr9poCnlTrfV/qDJsmTUnaYF5jTkYUsog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UqZwVdro;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JlUfRKBg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6CA606B598
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 11:26:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F6CA606B598
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UqZwVdro;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JlUfRKBg
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACAfUUa1954312
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 11:26:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Vhj1ufJteMxS+0DSsfOoaW55CKmz9agnW/ULo4cVWc=; b=UqZwVdrooj6X2Q1i
	BVZ05Pz4iIrBLqWJ5ZJrH5ebp1K2ELDeRD0jWDcC4jq8KkP2H5bbFDAmfHvZLI3z
	udDyqLHBY8Rbn8FHq4Sok7a7lvwiAw12BNVSBLpjfEWCtKwB/c8qZvQuMepFjGHK
	OH7Ot5m93lq38QWzAqnruVaMkBQ8JRIm0t92KEvS9fFmUso3mFFscydU1CjzR4SH
	T4tvapHY9MkX4iqUAQe4XjFSjOsO7sS4hpmgFQpCSh9M16O5sZPbbbo5LiGtOCou
	tC433x+hVMuJrMlu2/3KAnEe4wm/ExPeBzi+yW7KszpZj/6F8fkBurxoC51X6QuO
	rOxXeA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbx304qm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 11:26:31 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1a2b6fab7a6so754671c88.1
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 03:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794482791; x=1795087591; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Vhj1ufJteMxS+0DSsfOoaW55CKmz9agnW/ULo4cVWc=;
        b=JlUfRKBggoja6QFqyZ9oFag9BkmyE54TN7BANVvxC/dej/MVRn8Fr6wa/MzZNG+SGQ
         Tw63SzuCa+s3gHloBl9esh+CrC+f8l1BnpJLgQTqMw+ZbtFfPp9w0ipjTa2XeGSfX3AJ
         7hT6Bet2mzjW4/EQZFAYbt01es25wnG+M0AzyT5sHzlXXIgYlw7RjX97FRCXD2Az6uYz
         dZkKtfgWalRTqCNC7bfSGsIyR9Z5AjJ5HuA7fHcaBkbgdrbAgu+7GBsqvX4ZJCSKY0QK
         cAZoHMkhHYk0zsf1a50bPA6kOJ2VRMOvCB6XgnD/+rJxAIf44pputYAWKWxtGvYVMxgv
         fl7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794482791; x=1795087591;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Vhj1ufJteMxS+0DSsfOoaW55CKmz9agnW/ULo4cVWc=;
        b=ApmmhTuVsbjqYuH8wc1jJmPe0IdccGKMj575iX+sDV6XLCCxD7JmPoze1APjzESyRT
         kdj5QBz8xFHvFF5W7UZV4S3oHdxuEYh2Eo53GzAwQAoAezXk16UIw617U62D9YGWVOT+
         e+byDTv5XhSS8Zm+oNC9FRMvViZpe+gBI7hopQKZrjqN7pnatGurShwWG7HiYGhDoWQr
         CT0ct5+WUZAeO6yWK/MWGe8BlBRHBMUN0MLSaCPTg0i71HiLvo7W3hk2XYtV2BLl6eBT
         G35G9Qfe/qN8/8aYwKQYucQ8e1HnrrLJ8uo1dleqoshqQGPYiaH5PNwvxg4EJUxj1nTS
         19Tw==
X-Forwarded-Encrypted: i=1; AL+hErEeYDkt8q5amyaaDED9GnM11dlm69o5YxM64JGk8nZvciBktwxs/gJM4bz5BFu9f/h2aL0d70fUbyqIQHuD3Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z81XOJePVlYEKWSnQQ+My6fozgz/Mmw5IoGpHy5S/ChTm40+8en
	Ep32/7aDhe+3pe2aAwJnlQ9eZp5yUgvs4nHP1ah4NtSh4ecL+aspXkq68gIw11a7ZFcF7zSziyV
	ZMUA+YgNJUV6fQoA3YKSyU1PUMmKPVlhx8QdFNj4Tgh6OJPj+VsAUHAbe5q2uxiNxcAd0VQ==
X-Gm-Gg: AYBFou2pPPA6jf1Zr6H5QoFW0Tlyldfb2wy82v8gFXD2z3KzKvMtYX2vbPcONgudas5
	md0Od0KP0Tk2OJKvFtjUoyVDVsS/myaf8pPY1rwfqx0peuCY+agEL2fsmfUiqB/cdt5koJXBMFM
	M/L6OVdX1lVhWI0OoYpNUl1zEGHjqK8dDcPIJvp1yTlCCVkgewE1WunKrQLvVXdvHe7Q9Ya92aO
	Kb3CZqJ0y697OSMcuA6xXCnUdJpsvu0QRrS/OA0EDsoJNfYQlOIQPLIv7PttXs2eO08WFV99vp4
	27xtFgjanHT+lUgdQWBv1RYFcqjB5WwxRPiIPZKGPw+njkAPJOjA+STDHeUAoxwbw4rYijWrDIu
	NV4QsDBYBTaossM/Ln7kGP+WkOkEcmamDKlYT4Ri0/UG33HTlQG7d8cxoQ2ZaTmHjU6TLOOCmN+
	q2mo0JFhDpdqCrOAT/8fY/4gOe
X-Received: by 2002:a05:7022:b0c5:b0:181:6b8:31f1 with SMTP id a92af1059eb24-1b4f5f3475fmr1940014c88.10.1794482790977;
        Thu, 12 Nov 2026 03:26:30 -0800 (PST)
X-Received: by 2002:a05:7022:b0c5:b0:181:6b8:31f1 with SMTP id a92af1059eb24-1b4f5f3475fmr1939999c88.10.1794482790444;
        Thu, 12 Nov 2026 03:26:30 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm30402359eec.19.2026.11.12.03.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:26:29 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 03:26:00 -0800
Subject: [PATCH ath-next v3 01/10] wifi: ath10k: fix SDIO aux workqueue
 starvation in recovery detection
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
Message-Id: <20261112-10k-sdio-crash-v3-1-24f03f300bb2@oss.qualcomm.com>
References: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
In-Reply-To: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794482788; l=7443;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=w2wk9V4B0eogz6mgrte3TtOYqQINK7kGscMMBVt4Cxc=;
 b=NW+5Kybt9yjIlAStB0osczX21IR06KyxKTMnmjLnzr57iZqjCMW0p7owsRdSqav6TYPwGShUr
 ZPFMzZ3akGUDs/bapNG5IE1vOaFoSJoN/vPkWIywNCxQ6NouNsJg2Zp
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Authority-Analysis: v=2.4 cv=S+5MU4sP c=1 sm=1 tr=0 ts=6af5a267 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=iXikLL7u__TimuDzH34A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfXwX3AEkyUBHXZ
 upsY3vg55RzAYbSl6RrLyC65ZztS8h60cDL5J0zIcqPnSO6jIn9hn+Rnk+Fi6L2oIiDFVTRkrIX
 XxWiLjEwaHjvSh/lfJirgGkLBesCgjBUKTieCC7mBlRsbilZwY0mVVYeZUjBXgE8zIBtejx9TWO
 9eTQwzydAeB3NbHmxklU1BtAmCvLbt981UxhIcvALY22fB59LyLO/gHSClfwV7rhbIaxGSwjoFR
 Tyd0UGXPjNvKyWx5OJdaTK84JEey0uREGxldMcDd6O12kmuWxfEIRug0APd8al/9fVaFuWulWyb
 H7cGr46MYDzxgQdtj2W03V9clFLfOC0vJZ7VL8TFzIZ04dHjeJBGzbY9DkD+JAuKTyeaVm7gWGQ
 qSH60FVMixkucZVUlswvtdxOLLWCdSSakMIJq1byZ2Xr7xaNKUzgASQ6/DvpZg6ECTxMXTvBGS/
 F8h93alNYRbbmcUh55w==
X-Proofpoint-ORIG-GUID: LR7AxPK6Am99C19ItM3fa6GE1sk2-4ag
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfX9Q+9OvN6CEOT
 qniqq+qz7/Z27Q+Lq1hp3hTScMZdjuFTmvKn94QauAdw9NdRlfXjQSXagTbH9wyEOnsQO8Azsag
 2wdMkgMv6duc82EtxKxfr9NZ5qAbRGw=
X-Proofpoint-GUID: LR7AxPK6Am99C19ItM3fa6GE1sk2-4ag
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120045

Recovery monitoring runs on workqueue_aux, which is also
used by SDIO RX dispatch and WMI SERVICE_READY handling.

A single firmware crash may generate multiple recovery
triggers. Recovery detection currently handles each one by
waiting for recovery completion on workqueue_aux. On SDIO,
this blocks the same workqueue needed to deliver recovery
traffic, preventing recovery from completing.

As a result, otherwise recoverable firmware crashes fail
with:
  ctl_resp never came in (-110)

Treat duplicate triggers as part of the same recovery attempt. Use an
atomic compare-and-exchange on pending_recovery so only the first
trigger starts restart_work.

Convert the recovery monitor to self-rearming delayed work. While
recovery remains pending, the monitor periodically checks its state
without blocking workqueue_aux. Cancel the monitor when recovery
succeeds or the device is stopped.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Fixes: f35a07a4842a ("wifi: ath10k: move recovery check logic into a new work")
Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 71 +++++++++++++++++++---------------
 drivers/net/wireless/ath/ath10k/core.h |  2 +-
 drivers/net/wireless/ath/ath10k/mac.c  | 13 ++++++-
 3 files changed, 53 insertions(+), 33 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 7c2939cbde5f..82bb0bb72dc7 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2493,48 +2493,54 @@ static int ath10k_init_hw_params(struct ath10k *ar)
 
 static void ath10k_core_recovery_check_work(struct work_struct *work)
 {
-	struct ath10k *ar = container_of(work, struct ath10k, recovery_check_work);
-	long time_left;
+	struct ath10k *ar = container_of(work, struct ath10k,
+					 recovery_check_work.work);
+	int fail_count;
 
-	/* Sometimes the recovery will fail and then the next all recovery fail,
-	 * so avoid infinite recovery.
-	 */
-	if (atomic_read(&ar->fail_cont_count) >= ATH10K_RECOVERY_MAX_FAIL_COUNT) {
-		ath10k_err(ar, "consecutive fail %d times, will shutdown driver!",
-			   atomic_read(&ar->fail_cont_count));
-		ar->state = ATH10K_STATE_WEDGED;
+	if (ar->state == ATH10K_STATE_WEDGED)
 		return;
-	}
-
-	ath10k_dbg(ar, ATH10K_DBG_BOOT, "total recovery count: %d", ++ar->recovery_count);
 
-	if (atomic_read(&ar->pending_recovery)) {
-		/* Sometimes it happened another recovery work before the previous one
-		 * completed, then the second recovery work will destroy the previous
-		 * one, thus below is to avoid that.
-		 */
-		time_left = wait_for_completion_timeout(&ar->driver_recovery,
-							ATH10K_RECOVERY_TIMEOUT_HZ);
-		if (time_left) {
-			ath10k_warn(ar, "previous recovery succeeded, skip this!\n");
-			return;
-		}
+	/*
+	 * Pure monitor: only ath10k_core_start_recovery() starts a fresh
+	 * cycle. Bail if there is nothing in flight.
+	 */
+	if (!atomic_read(&ar->pending_recovery))
+		return;
 
-		/* Record the continuous recovery fail count when recovery failed. */
-		atomic_inc(&ar->fail_cont_count);
+	/* Record the continuous recovery fail count when recovery is late. */
+	fail_count = atomic_inc_return(&ar->fail_cont_count);
 
-		/* Avoid having multiple recoveries at the same time. */
+	if (fail_count >= ATH10K_RECOVERY_MAX_FAIL_COUNT) {
+		ath10k_err(ar, "consecutive fail %d times, will shutdown driver!",
+			   fail_count);
+		ar->state = ATH10K_STATE_WEDGED;
 		return;
 	}
 
-	atomic_inc(&ar->pending_recovery);
-	queue_work(ar->workqueue, &ar->restart_work);
+	/* Recovery still in flight; check again later. */
+	queue_delayed_work(ar->workqueue_aux, &ar->recovery_check_work,
+			   ATH10K_RECOVERY_TIMEOUT_HZ);
 }
 
 void ath10k_core_start_recovery(struct ath10k *ar)
 {
-	/* Use workqueue_aux to avoid blocking recovery tracking */
-	queue_work(ar->workqueue_aux, &ar->recovery_check_work);
+	if (ar->state == ATH10K_STATE_WEDGED)
+		return;
+
+	/*
+	 * SDIO raises several triggers within microseconds of one crash;
+	 * only the first winner starts a fresh cycle. Losers do nothing
+	 * while the owner runs recovery.
+	 */
+	if (atomic_cmpxchg(&ar->pending_recovery, 0, 1) != 0)
+		return;
+	ath10k_dbg(ar, ATH10K_DBG_BOOT, "total recovery count: %d",
+		   ++ar->recovery_count);
+	/* Start a fresh failure budget; the last cycle may not have completed. */
+	atomic_set(&ar->fail_cont_count, 0);
+	queue_work(ar->workqueue, &ar->restart_work);
+	queue_delayed_work(ar->workqueue_aux, &ar->recovery_check_work,
+			   ATH10K_RECOVERY_TIMEOUT_HZ);
 }
 EXPORT_SYMBOL(ath10k_core_start_recovery);
 
@@ -3727,7 +3733,7 @@ struct ath10k *ath10k_core_create(size_t priv_size, struct device *dev,
 
 	INIT_WORK(&ar->register_work, ath10k_core_register_work);
 	INIT_WORK(&ar->restart_work, ath10k_core_restart);
-	INIT_WORK(&ar->recovery_check_work, ath10k_core_recovery_check_work);
+	INIT_DELAYED_WORK(&ar->recovery_check_work, ath10k_core_recovery_check_work);
 	INIT_WORK(&ar->set_coverage_class_work,
 		  ath10k_core_set_coverage_class_work);
 
@@ -3764,6 +3770,9 @@ EXPORT_SYMBOL(ath10k_core_create);
 
 void ath10k_core_destroy(struct ath10k *ar)
 {
+	cancel_work_sync(&ar->restart_work);
+	cancel_delayed_work_sync(&ar->recovery_check_work);
+
 	destroy_workqueue(ar->workqueue);
 
 	destroy_workqueue(ar->workqueue_aux);
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index dfee432615eb..e8fcbef38ca6 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -1207,7 +1207,7 @@ struct ath10k {
 
 	struct work_struct register_work;
 	struct work_struct restart_work;
-	struct work_struct recovery_check_work;
+	struct delayed_work recovery_check_work;
 	struct work_struct bundle_tx_work;
 	struct work_struct tx_complete_work;
 
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 8e604697d6c2..3c45e5483b60 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -5427,7 +5427,15 @@ static void ath10k_stop(struct ieee80211_hw *hw, bool suspend)
 	cancel_work_sync(&ar->set_coverage_class_work);
 	cancel_delayed_work_sync(&ar->scan.timeout);
 	cancel_work_sync(&ar->restart_work);
-	cancel_work_sync(&ar->recovery_check_work);
+	cancel_delayed_work_sync(&ar->recovery_check_work);
+
+	/* ath10k_stop() can race with an in-flight recovery. Clear the
+	 * recovery state after the works are cancelled so a later
+	 * ath10k_start() can start a fresh cycle instead of being blocked
+	 * by a stale pending_recovery that nothing will clear.
+	 */
+	atomic_set(&ar->fail_cont_count, 0);
+	atomic_set(&ar->pending_recovery, 0);
 }
 
 static int ath10k_config_ps(struct ath10k *ar)
@@ -8170,6 +8178,9 @@ static void ath10k_reconfig_complete(struct ieee80211_hw *hw,
 		ar->state = ATH10K_STATE_ON;
 		ieee80211_wake_queues(ar->hw);
 
+		/* Cancel the monitor first so it cannot bump the count after reset. */
+		cancel_delayed_work_sync(&ar->recovery_check_work);
+
 		/* Clear recovery state. */
 		complete(&ar->driver_recovery);
 		atomic_set(&ar->fail_cont_count, 0);

-- 
2.34.1

