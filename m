Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482796;
	b=jyOwnlvYPaCsaiJ6SJN5JUF8F9pxgkgcLqbYxHGfQsPkX6W+nBPwvwssEnMy/2o+tu94
	 chs6Iw2ZU25/iJP019BUrPSZiruTgZCCK6RK61fhdgwGOvQWN0JnjyIU5BG5kGnFJd8Wx
	 bdmVG77V39CFAJlcCRuLKGs4gx2pH4lmd1MUg99cdKbE0tH4pO6egRtqRBC6XnyBVz31d
	 x4WHeRMwnm4pyy4mCtaQCxaUA1ojNrvUfj45EgYMOKPvFPqD+5cW4mdEHIV3XJVSQlAer
	 /Ch7PcCYBpaN/mD3CLgqEFdRTjCWMcZ+BY/isy3tUhpOszp/ZV5Fjxk5lVKLsv8fs5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482796;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uTE3xEgwRPhVRHjOg6hOFWbbifgwhiynhlIrm1FKuxY=;
	b=Li4kkhhDkX96wPXqVDx34nxpHllqO124UViqCxeV4WEbaGJimUERLhah8sqsEAspa8qF
	 FCZckAN70dnuk+3nsTT++zKuG0Gcc9x+g68//F1jr3J0zoujQT5/lyJGAaBcJcGVvECLC
	 gx1OoNOfJ0u/zXYVFe26R2mTMCOW2s5kW4260o+v34rIzyIvMEu2PWRt7VP22xY3gseYj
	 4tuNucF7r2c6gRXzuv3csHOhIPkxwtH5HvZo/uhjZy9fh9HcZL4084rbSvKd4I2KPWiUr
	 myuT4zRuGA6GiXLyBBe7F9qJHvZXJ9QsuC5QNTZr5bCF4/5x1hkordf5UfDCtAmda9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yfe2y8F4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QJb137NE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4E7606C156
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 11:26:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA4E7606C156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yfe2y8F4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QJb137NE
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACAmmHP2555567
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 11:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uTE3xEgwRPhVRHjOg6hOFWbbifgwhiynhlIrm1FKuxY=; b=Yfe2y8F4yKwft9Xs
	t4scDgF36LcFvRH/UrkBfPUdkWhG/f9gnFw9ZK1brtprJrQ+Wx12ma5eWDwiOmUs
	zAv5m3d9XkZAajL4ijudtxarLxKgXMSyoF0/3ZQpHyXULumc34GxF+s2kCaetQIW
	RBUvg4WS9djtFjEX2E9ypWaLVyDlrcr45tu8TVXzPO1RQeLLpGJ6dFUl5K7pj08G
	sZsr35EO6gAKHbkTCccRQ088/jigco8tm4TNgYQShRt0pLzAOUnw9N+x9+P2sVkD
	nsDcPR3Y6kg75m0RGf0X/G4aw1YKLF61j9uqtGZ94t6O/t2kGPEGZoWgXHEy8Xhc
	KsbUEg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwc1j03tc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 11:26:34 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3425098ae4bso628920eec.0
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 03:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794482794; x=1795087594; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uTE3xEgwRPhVRHjOg6hOFWbbifgwhiynhlIrm1FKuxY=;
        b=QJb137NEiqldvXs+rm7zPRg4PexRd+OpzBrVgVfoRQWBoOCnoiGIbdjwWMQ5hmutFr
         dd8iG6pr80iOLFB9YN6XBoxNG8SQnOj80a9oQg8osDha2Ua5Fo9U4S4i9mvZxTasUVOF
         hEEhr1X/Wwv837LQ4Sz1hSmiUjpwP+WWfO9sJDNq/r+AqAuPw/nPvkDiFwFGy1ZoPbUl
         ROWk5ZJBgo7JzAjiLFD2yHRYWw4/fY3WczL5D4aLbqHoNBm8yKnFaI18hCQ7HFzfH10E
         aYT0rGjMzUlus73YZ1RDoCkrHbHKG33BtJ2COlu7lPH002rknbET4SUUSbA+HShr20Ad
         VeMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794482794; x=1795087594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uTE3xEgwRPhVRHjOg6hOFWbbifgwhiynhlIrm1FKuxY=;
        b=CZ17Ckuxf+rDcYDvlBrR0ZKH/c0EBpGj/KVF9gnlAp6f6k3ztBVomooYgPeHDWSAGz
         iSWYDILzRyQNFmKs2LYqMRcpfgVUKkD3BaFJyHyDZ4n8zPUkDxx1FgV5NlYaOT64qSpo
         nBtQJtuNr4GiXTZ2EwwR/mILjMyUmRdYL/MYwTcDLt8I2UFdMm2YrgNiGPXDlChXI9we
         BZMtGwx1c+blJL7/olT855SRuK1AUydZClA2bPHUEQxZ0RisUW6J6Vs77pZEdSrWdniD
         7Jj5XqyvUOcjR/kmNzHwefEPcgUfduf9Af7o8+NlqLRVi/2rJIojhl4Y8m0UfshFclnf
         Rb0w==
X-Forwarded-Encrypted: i=1; AL+hErFflR2bGEHn6VDWW76dnZ3XqCq7uE9DCkEcYjwbN5F5vKnoWc/puYTC6yXBsxyxMnWmLJCojuZfxJkslKPv7A==@vger.kernel.org
X-Gm-Message-State: APuU4Z88Y9eAciiuKbZ6c2jWf4FJsk0dCRtoG5jT72DJ65yxxy9Gzpd/
	Y6Tq2qq91BGq2nRGfwWkSJG5NNGT5/ROBGPs5wJg/Cqrhfiqk5k99eHH/xF4RpqbXJCEMs9Jeqq
	+7H4iOxZntSw7yOBlq/cWjjm2SgL5tPV4V8xoESoAKOHwzErtDMGjCup2TNV/M1rfFjPTzw==
X-Gm-Gg: AYBFou0Ip23CfY4PyF21DcTUpEHS6L8y0rX/L76gjSne9IhNbaFI1j1VSknjBoZube7
	mB9pabtjSq6yswyRarCrCsWTxP+Rl0sy86RhyrJPgXY2b+cQSoadrizYHpgqVumO60q0eYu40Jw
	hR65x3SozFeVSVXKJdfOV2uBrUki5g4P2U5JCob5VznhBhaC7qwTBvBCfLyFpeYuc2S4Dhycvpd
	XP131X7n+YipT3neR7Zm3YHE1pL9VkhhssYVImOHEBXkeEY1QrdlBa0Zt5R1lE2kmbVF98eWJbp
	Kf/M3htxh9sgqLfxKS+cR1I/YGhgfrZOMu8q5DcQve/DUuLtbau98gE/4obghXymLMlMDxC+VP6
	O5fCV/F8Q+GbQtIFuni+ZdWhYrLW/kZtbMjj9/BdQHy0/xeOawAZjB0qoUwzkTwkPYf26xJMIoT
	SnWjuCYMXDNjCW9ongO2kJz6Kd
X-Received: by 2002:a05:701b:451b:10b0:1b2:67f9:43cb with SMTP id a92af1059eb24-1b4f5f5c6f8mr1793655c88.17.1794482793564;
        Thu, 12 Nov 2026 03:26:33 -0800 (PST)
X-Received: by 2002:a05:701b:451b:10b0:1b2:67f9:43cb with SMTP id a92af1059eb24-1b4f5f5c6f8mr1793635c88.17.1794482792952;
        Thu, 12 Nov 2026 03:26:32 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm30402359eec.19.2026.11.12.03.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:26:32 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 03:26:03 -0800
Subject: [PATCH ath-next v3 04/10] wifi: ath10k: bound recovery time before
 entering WEDGED
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
Message-Id: <20261112-10k-sdio-crash-v3-4-24f03f300bb2@oss.qualcomm.com>
References: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
In-Reply-To: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794482788; l=4671;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=5MbJGy3RKq7arlk2SmcDcqcx7B4AcQTA9zf0fasV+sg=;
 b=g3D0EhqXJG9fjy0mDDD7e2heYqdHCE/8OejmeSLLW+NKPouJwdn6r8ekvYro/KoAkaiHfHCWc
 OoAjHn0L+c3AcECTf1EueeyHpKnZn0k8tQkuZ9gsliwlcgchH8oXRLM
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfXyDrRvPTmmrXm
 8ND/oCEGlmSHU5Al1u43rfIsfQ8BSQFTWhG6ApOlBI6SdX/9fdMofEGx73DqSRngu69Z11V5y/G
 vniu+67gkHAgCiYhAjKY7c1L1Spz+Cw=
X-Proofpoint-ORIG-GUID: W6Q1_ZMLO3Fo0RuKjmmlXOb9Na-PBB8q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfX5eVDrjT9vAVz
 5tiEfE98LPChoo2zWaN5i4oiFxPUnDKmG6ttuWUQQCfLQ0DlqVZ4/YSG2CT4rkTHnPmk2ak8d/Q
 LvLjLQohalcPcR0lXknrf81BtVoIReXzk43ZgnfNPN3vwUSOSfuifCeK9N2s7cSeukohk4mL/YO
 J95F2S9HheJxTfB0sdSkfqK1wdd81cNPXY2VuRHQ3TCRWRl87vfLNa4w/Ds3iPCP5NdJtCnW0ov
 LeoVr1iaFKgob2K4URbn/LS1tw3nqM8fJahr4P4MqIkWxjt3hqJ+bADllAcGwXWbXJk0RhEXVAk
 9TurLGtAtzCVXyefiErQ++RumQuYBkfV/rkvTENsb8hD2nSyCt1nhdU7qpQQdqGbE3/wlSBRH0k
 ZFNTssycHj/1wZ6aXapzv8prsNAymSxCBV6NKYJYyf+pSzEF4Bn0C6bzWbSdgfq/60UeFoRkWNd
 jdz10dbYU4ZCMDW93jA==
X-Proofpoint-GUID: W6Q1_ZMLO3Fo0RuKjmmlXOb9Na-PBB8q
X-Authority-Analysis: v=2.4 cv=Vqe2kO2n c=1 sm=1 tr=0 ts=6af5a26a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=8Byw8hCbu9Kz8BjWs2cA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120045

Commit c256a94d1b1b ("wifi: ath10k: shutdown driver when
hardware is unreliable") added fail_cont_count tracking and
declared the device wedged after recovery remained pending for
a fixed number of timeout checks.

The monitor currently relies only on the number of checks and
does not consider how long the recovery attempt has actually
been running. Blocking waits in the recovery path may delay its
completion, so waiting for four timeout checks can consume most
of the suspend watchdog budget before the device enters
ATH10K_STATE_WEDGED.

This leaves insufficient time for blocked callers to exit and
for the driver to complete the WEDGED transition and shut down.

Record when each recovery attempt starts and add a 15-second
deadline based on the elapsed recovery time. Declare the device
wedged when either the deadline expires or fail_cont_count
reaches ATH10K_RECOVERY_MAX_FAIL_COUNT.

Also reduce ATH10K_RECOVERY_MAX_FAIL_COUNT from four to two so
a recovery that remains pending reaches the WEDGED state sooner
when the monitor runs normally.

This prevents a failed recovery from consuming the suspend
watchdog budget before the driver can shut down cleanly.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Fixes: c256a94d1b1b ("wifi: ath10k: shutdown driver when hardware is unreliable")
Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 10 +++++++---
 drivers/net/wireless/ath/ath10k/core.h | 10 +++++++++-
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index d86c4ead06e6..f6b6b81a4896 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -15,6 +15,7 @@
 #include <linux/ctype.h>
 #include <linux/pm_qos.h>
 #include <linux/nvmem-consumer.h>
+#include <linux/jiffies.h>
 #include <asm/byteorder.h>
 
 #include "core.h"
@@ -2526,6 +2527,7 @@ static void ath10k_core_recovery_check_work(struct work_struct *work)
 {
 	struct ath10k *ar = container_of(work, struct ath10k,
 					 recovery_check_work.work);
+	unsigned long recovery_start = READ_ONCE(ar->recovery_start_jiffies);
 	int fail_count;
 
 	if (ar->state == ATH10K_STATE_WEDGED)
@@ -2541,9 +2543,10 @@ static void ath10k_core_recovery_check_work(struct work_struct *work)
 	/* Record the continuous recovery fail count when recovery is late. */
 	fail_count = atomic_inc_return(&ar->fail_cont_count);
 
-	if (fail_count >= ATH10K_RECOVERY_MAX_FAIL_COUNT) {
-		ath10k_err(ar, "consecutive fail %d times, will shutdown driver!",
-			   fail_count);
+	if (fail_count >= ATH10K_RECOVERY_MAX_FAIL_COUNT ||
+	    time_after(jiffies, recovery_start + ATH10K_RECOVERY_DEADLINE_HZ)) {
+		ath10k_err(ar, "recovery timeout %ums, fail count %d, shutting down driver!",
+			   jiffies_to_msecs(jiffies - recovery_start), fail_count);
 		ath10k_core_enter_wedged(ar);
 		return;
 	}
@@ -2569,6 +2572,7 @@ void ath10k_core_start_recovery(struct ath10k *ar)
 		   ++ar->recovery_count);
 	/* Start a fresh failure budget; the last cycle may not have completed. */
 	atomic_set(&ar->fail_cont_count, 0);
+	WRITE_ONCE(ar->recovery_start_jiffies, jiffies);
 	queue_work(ar->workqueue, &ar->restart_work);
 	queue_delayed_work(ar->workqueue_aux, &ar->recovery_check_work,
 			   ATH10K_RECOVERY_TIMEOUT_HZ);
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index e8fcbef38ca6..a1ded2cba103 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -88,7 +88,13 @@
 #define ATH10K_ITER_RESUME_FLAGS (IEEE80211_IFACE_ITER_RESUME_ALL |\
 				  IEEE80211_IFACE_SKIP_SDATA_NOT_IN_DRIVER)
 #define ATH10K_RECOVERY_TIMEOUT_HZ			(5 * HZ)
-#define ATH10K_RECOVERY_MAX_FAIL_COUNT			4
+#define ATH10K_RECOVERY_MAX_FAIL_COUNT			2
+/*
+ * Some platforms configure suspend watchdogs as low as 25s; cap the
+ * total recovery time well under that so the WEDGED transition and
+ * any teardown that follows still have room to run before it fires.
+ */
+#define ATH10K_RECOVERY_DEADLINE_HZ			(15 * HZ)
 
 struct ath10k;
 
@@ -1215,6 +1221,8 @@ struct ath10k {
 	unsigned int recovery_count;
 	/* continuous recovery fail count */
 	atomic_t fail_cont_count;
+	/* jiffies when the current recovery attempt started */
+	unsigned long recovery_start_jiffies;
 
 	/* cycle count is reported twice for each visited channel during scan.
 	 * access protected by data_lock

-- 
2.34.1

