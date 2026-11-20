Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164176;
	b=pFliuXlje9JLLwnHNdmdrjMoSolhKuM1nlfjSIT3Uz7mg9krOjSr6JHPvc+5ebu/TWSB
	 jtA/PG1I7P//KxUsJNCcIdqwCNQr2RZuhOFgqWm4/tk9v82wzXLbi8fYOkdU1FpsHkU5m
	 cCZ5Q27TgeOiNqm4SI0nWdWAsiBzggwM5TBtsExg1t4AUoSZr8wWJLpoMQsA/0gRVf2dV
	 p2o3mhYVTrUDpPFfFhrqBC8Cq1g7Jclrch0WBEBvpLVkz1w/I2c88EGSaylM2P6hqvCnV
	 CRgAfMwt02BquGuZWXvnpyNCRM3jv4kxL3Exrts713uPX6CFpe/tek8UBik1yb7sFXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164176;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jQYUXYfPdq2fPt8IRznIPlgb9WmYLP4BPqusT9g3Z00=;
	b=3mDLDkcDvvMONPy/Ng45B+FdyUSRXs/pn69fohm8DxO80tA6rAsZfORgxLZhUSY11BKl
	 Li8N8ruTy+sYbSIRo3tNyU0IkDEGn6zekmbuKsxc9Ipk2us5vp1mPhw6h+QDcxCFSolnI
	 qwCUlJ41Sl2IAivr30mcJn7chqGhGCG8WYu9+neBH0HSxSgt5TJtVAbUUaqI37yxa/X76
	 JK+nm4Ue5dW8MjcoDyJww0tHm9bOWthyhGbXHJaouUbEierR1DM9y0cBfzVKufgltF9VY
	 N0uU+mvKntToE40ItbMQKBIq1yZkFYjRpMMGFPnmHV0fFkWbWpzDpYg0H4k8PNtacVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CAwd3YLJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BN5FLdjI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1521A606A335
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 08:42:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1521A606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CAwd3YLJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BN5FLdjI
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7eqSx1268345
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 08:42:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jQYUXYfPdq2fPt8IRznIPlgb9WmYLP4BPqusT9g3Z00=; b=CAwd3YLJ2Xq+DPcf
	jUHBNIJrBOWskBJjqdy5BBi4aQdaLnlzPL5hLn4UWKkwqU2BCTjAB2/kYKF25bMJ
	+YK2tHMDLOc4pprfK4/muIXcYKBTdhc6GwjDV0fT76nAS8S0qGsXwUGddZoxhbew
	ITatdu7xJF4to0QTaqoQb0C6Wkh8eK7wDcWBYW4ySAVfNcJeG0z/Ci3+qgrhykx2
	XvJ7eqKTSP9kVsPx0mfQFj+jG1zq+1LgtPJBiqwHiXufmOFxpTLzXvGQfmFeJ994
	ux54+ih/XXlJe1taTo6cOD7k6XmllvqtqfX0VqhRoAnRdUDAamL+84WhwMdXjL1K
	eVrX6Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2cd1sgum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 08:42:55 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-38131260a5dso1662450eec.0
        for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 00:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795164174; x=1795768974; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jQYUXYfPdq2fPt8IRznIPlgb9WmYLP4BPqusT9g3Z00=;
        b=BN5FLdjI3/wDUeZhq4kEZogMBqH770fZ+W7bjo3wk9gExE4DVECAV7jvf3xT2UwBIT
         Ncn0fwR2Ta7XKdCff7LM3/ORRgxK9Tec7pEKwZo88ig2rYMUJ4Tyk7qH/5SU8cWx47hC
         iQNYmE6X9FohK2M78aLpgF4wVOz3IrkF7tqdJaGs7/dR4c3NY3/3H7afU/52AXXOBqoW
         xTV/mk9rswWC6xnta2Cu4MFjn02/3BG+JQHg7wDaHf2vWPVolMvgbnQHG1sS9g6gV6Il
         3gWEvt2uVY+ZkH+YlwYGmKMqwLdUopjmBGfpshed/F6SfJ/Zwq10Bw3q642LDxptDQp1
         wc3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164174; x=1795768974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jQYUXYfPdq2fPt8IRznIPlgb9WmYLP4BPqusT9g3Z00=;
        b=wdvI2e+faguZEFBy4lt6MDwpOkZ1lXR12ab3U5s11yP9aP6j7tNXiWd7Qg0OqTMBEO
         f0UOTJC6uKi52FqrlonRLOs8MMRgutk4zNVyQrfm+QHf//AuQRqcg+JgbSEmPPvqHczy
         FHCWWjd2jC+qBSfR8BEwotGGU5h34TrroK9wmpvhJsXI9thtGDcK6XCn1ZHqIGOvutSL
         piounX8lgJSIqPmSBQd4Uau6RGs6mwZs8CV0/K3a6ifsORgCWinMzf+JI7lwtqTya4nh
         G6zXNVJ2KQEqW0WhS3YqDnsiHabVSfvS+IiclfZDWXZ1tWEm3UrQB+GEXLXXyfGtmOqL
         qbwg==
X-Forwarded-Encrypted: i=1; AL+hErGV2uyurYvB6nCuzq5Cvq4PRd1wL4/PzcUn4umcgLc9248a2dG4XmY9NoObl3iGNQ+xLcERQwNIPIrtXWWs1g==@vger.kernel.org
X-Gm-Message-State: APuU4Z/bv/CJtUW4V8QRtU5TPitRl9pqPtXtosq2iHoCdjiX0cqIp1u8
	jv/YU7qhf3r+cHpWq0R1ri0YB4RXaW7bwQqhklQAwK9e5JKbWTIjpr+h9JeSE+B74wXFgATSW9i
	nsNiv6eMNlJSEQrDBWEb8OuqMbJ69Ty3eXg8LzdjtDqbk3sZ7AL9yy+NYKyl9EH/PXRUU5w==
X-Gm-Gg: AZFdTZfKb8ad9igCrOdv9ylG5LTZVX7scI+GTP6APggaONzmTwvXgto5iTyOfG4/6Az
	VrrstRx31aP/cDO99EhZqe8YjOXhbXRlvt3Hka/XrspPK+XusbIynadVXCoAiDORWHdlJwsDOwq
	uzOUX+H36c+vD0AZJkFG5+tl0rsr/FbRrrwXBOucNAQNS4sKNUQRj5KCc8wVmItjt4GBQeuZsQe
	AuZpBMbRTgMfI06B6KkSk8JfUsKo43i976IhBCTuwvTVIHQyv3NuuY1Aqw3omyiYbIlyMqjaV07
	ge9BBOJ7AoG7dyz+mKBVitNgnsGgT8r3hlBNbytSqXgJ8j3Ti7u7McaAoUsLjBV+LEqsFdN0Lm/
	u1eDzJ3nyD0g0oMc5JiQDjjNp4+LwpV4dYLpPa7uIWDdDjR0/0iP6MyMZY5h4dJpi2cgq5Ahmda
	qSGw5zaXiEu4q3oxlvBKF9x6s=
X-Received: by 2002:a05:693c:8083:b0:377:678:2309 with SMTP id 5a478bee46e88-3856ef47a98mr2121405eec.15.1795164174092;
        Fri, 20 Nov 2026 00:42:54 -0800 (PST)
X-Received: by 2002:a05:693c:8083:b0:377:678:2309 with SMTP id 5a478bee46e88-3856ef47a98mr2121375eec.15.1795164173531;
        Fri, 20 Nov 2026 00:42:53 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm7326352eec.5.2026.11.20.00.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:42:53 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 00:41:26 -0800
Subject: [PATCH ath-next v4 01/10] wifi: ath10k: fix SDIO aux workqueue
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
Message-Id: <20261120-recovery-v4-v4-1-53d6a04490e0@oss.qualcomm.com>
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
In-Reply-To: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795164171; l=8944;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=9gqH+Au05myLHxq7lWVgy1ylKzPzsDxr90eUYmZFMLw=;
 b=ymOiYkz0ORlHEtbatsfnv8cUOBmJnk1hB83qcYOee+PetBcOFt6wx4vxEP0qc/73EelhESl5k
 MS3oPJim8NSDz5+3Fg/NfeH0vh35rFHe3V2wGJggnfuX1914nShfa55
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Authority-Analysis: v=2.4 cv=Dt/Da2/+ c=1 sm=1 tr=0 ts=6b00080f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ekyff-_h-x0lYrcLLmUA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: rD1FzeiP2gVRGMSAE1QOVgmYq18-kvs3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfXypuyLtawx+9B
 MP/342NWhh/kxmhZePQZxjPD7tKeP2Kc/5hBgKYrHdlCplQ9uZoFGuwM4Km+fAZSY/tqS3bsvqJ
 +napVa4CqqudlO+32E6DTA36Mh/4VvD3LnQ3svsaVErmTiGduZ5Z34+0a5jKaB4NWbxlJYhMNyC
 gDeXLaPOLFJCAhrweOBmZP3v3w/orCYHmx0fMpPzNkj00mLANIP9I4MfrwkYiGDo+1C660LfJSH
 Te3ApsFo77fglgzsF1pRSvbbbXdfxvZ+cVM/lsz2yiY4PdEDIWTmSinoPxNIrz17WAn8cUD03xu
 EYmCPfeNzDc3MXVXY/qHWdNEKd2sYbawhLlOfYXuuLDiO9N7izXQ6cvqfyCF/ZR8RuBKbkNcZV+
 P4X5sKldAr9W2i07UbM9AH7zuu85r2G2wvL2DySSrel3PsePTfQLEa6XVgyRqk4HIus1+5yZPPh
 HnR7Jc5z2I/LyDsejjQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX3pQdGnH8cbGX
 aa1fLQ9tm4nvRJ185XwUWFYiOO9wZk5hOu1ub2dbcz4XGzeD1kGTLgUcwIQENHdouE0l/1PlVdx
 pGH2SYPKqTPD85QYbpArcsD7sbe5WV8=
X-Proofpoint-ORIG-GUID: rD1FzeiP2gVRGMSAE1QOVgmYq18-kvs3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200034

Each recovery trigger queues recovery_check_work on workqueue_aux. If
a recovery is already pending, the work blocks for up to 5 seconds
waiting for it to finish, and marks the device WEDGED after four
failed waits.

On SDIO, one firmware crash can raise several triggers. workqueue_aux
also runs SDIO RX and WMI SERVICE_READY handling, so the blocked
check stalls the traffic the recovery itself is waiting for. Recovery
then fails with "ctl_resp never came in (-110)", and a recoverable
crash ends up WEDGED.

Stop waiting on workqueue_aux. Let only the first trigger start a
recovery, using atomic_cmpxchg() on pending_recovery, and ignore the
rest. Replace the wait-and-count logic with a single 20 second
delayed work, the same bound as four 5-second waits. If recovery has
not completed when it fires, mark the device WEDGED. Since the
deadline already covers elapsed time, fail_cont_count is no longer
needed and is removed.

Because pending_recovery is now set only once per recovery, any path
that abandons a recovery must clear it. Otherwise the next crash is
ignored: the device is neither restarted nor marked WEDGED. Clear it
in ath10k_stop(), and in ath10k_core_restart() when the device is OFF
and there is nothing to restart. The OFF case was found by code
inspection and has not been reproduced.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Fixes: f35a07a4842a ("wifi: ath10k: move recovery check logic into a new work")
Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 75 +++++++++++++++++++---------------
 drivers/net/wireless/ath/ath10k/core.h |  7 +---
 drivers/net/wireless/ath/ath10k/mac.c  | 15 ++++++-
 3 files changed, 56 insertions(+), 41 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 2aa18adb31cc..b536c21630b1 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2535,48 +2535,45 @@ static int ath10k_init_hw_params(struct ath10k *ar)
 
 static void ath10k_core_recovery_check_work(struct work_struct *work)
 {
-	struct ath10k *ar = container_of(work, struct ath10k, recovery_check_work);
-	long time_left;
+	struct ath10k *ar = container_of(work, struct ath10k,
+					 recovery_check_work.work);
 
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
-
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
 
-		/* Record the continuous recovery fail count when recovery failed. */
-		atomic_inc(&ar->fail_cont_count);
-
-		/* Avoid having multiple recoveries at the same time. */
+	/*
+	 * Pure deadline monitor: it is armed by
+	 * ath10k_core_start_recovery() and cancelled once recovery
+	 * completes. Bail if there is nothing in flight.
+	 */
+	if (!atomic_read(&ar->pending_recovery))
 		return;
-	}
 
-	atomic_inc(&ar->pending_recovery);
-	queue_work(ar->workqueue, &ar->restart_work);
+	ath10k_err(ar, "recovery did not complete in %u ms, will shutdown driver!\n",
+		   jiffies_to_msecs(ATH10K_RECOVERY_TIMEOUT_HZ));
+	ar->state = ATH10K_STATE_WEDGED;
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
+	/* Arm the monitor before queueing restart_work so that restart_work
+	 * can cancel it if there turns out to be nothing to restart.
+	 */
+	queue_delayed_work(ar->workqueue_aux, &ar->recovery_check_work,
+			   ATH10K_RECOVERY_TIMEOUT_HZ);
+	queue_work(ar->workqueue, &ar->restart_work);
 }
 EXPORT_SYMBOL(ath10k_core_start_recovery);
 
@@ -2655,6 +2652,13 @@ static void ath10k_core_restart(struct work_struct *work)
 		 * or if the crash happens during FW probing
 		 */
 		ath10k_warn(ar, "cannot restart a device that hasn't been started\n");
+		/* Nothing will be restarted, so no recovery is pending any
+		 * more. Leaving pending_recovery set would block the next real
+		 * recovery and let the monitor wedge a device that is started
+		 * later.
+		 */
+		cancel_delayed_work(&ar->recovery_check_work);
+		atomic_set(&ar->pending_recovery, 0);
 		break;
 	case ATH10K_STATE_RESTARTING:
 		/* hw restart might be requested from multiple places */
@@ -3769,7 +3773,7 @@ struct ath10k *ath10k_core_create(size_t priv_size, struct device *dev,
 
 	INIT_WORK(&ar->register_work, ath10k_core_register_work);
 	INIT_WORK(&ar->restart_work, ath10k_core_restart);
-	INIT_WORK(&ar->recovery_check_work, ath10k_core_recovery_check_work);
+	INIT_DELAYED_WORK(&ar->recovery_check_work, ath10k_core_recovery_check_work);
 	INIT_WORK(&ar->set_coverage_class_work,
 		  ath10k_core_set_coverage_class_work);
 
@@ -3806,6 +3810,9 @@ EXPORT_SYMBOL(ath10k_core_create);
 
 void ath10k_core_destroy(struct ath10k *ar)
 {
+	cancel_work_sync(&ar->restart_work);
+	cancel_delayed_work_sync(&ar->recovery_check_work);
+
 	destroy_workqueue(ar->workqueue);
 
 	destroy_workqueue(ar->workqueue_aux);
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index dfee432615eb..2e100dd246e2 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -87,8 +87,7 @@
 				  IEEE80211_IFACE_SKIP_SDATA_NOT_IN_DRIVER)
 #define ATH10K_ITER_RESUME_FLAGS (IEEE80211_IFACE_ITER_RESUME_ALL |\
 				  IEEE80211_IFACE_SKIP_SDATA_NOT_IN_DRIVER)
-#define ATH10K_RECOVERY_TIMEOUT_HZ			(5 * HZ)
-#define ATH10K_RECOVERY_MAX_FAIL_COUNT			4
+#define ATH10K_RECOVERY_TIMEOUT_HZ			(20 * HZ)
 
 struct ath10k;
 
@@ -1207,14 +1206,12 @@ struct ath10k {
 
 	struct work_struct register_work;
 	struct work_struct restart_work;
-	struct work_struct recovery_check_work;
+	struct delayed_work recovery_check_work;
 	struct work_struct bundle_tx_work;
 	struct work_struct tx_complete_work;
 
 	atomic_t pending_recovery;
 	unsigned int recovery_count;
-	/* continuous recovery fail count */
-	atomic_t fail_cont_count;
 
 	/* cycle count is reported twice for each visited channel during scan.
 	 * access protected by data_lock
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 8e604697d6c2..74aca0af11c8 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -5427,7 +5427,14 @@ static void ath10k_stop(struct ieee80211_hw *hw, bool suspend)
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
+	atomic_set(&ar->pending_recovery, 0);
 }
 
 static int ath10k_config_ps(struct ath10k *ar)
@@ -8170,9 +8177,13 @@ static void ath10k_reconfig_complete(struct ieee80211_hw *hw,
 		ar->state = ATH10K_STATE_ON;
 		ieee80211_wake_queues(ar->hw);
 
+		/* Cancel the deadline monitor first so it cannot declare the
+		 * device wedged after recovery has completed.
+		 */
+		cancel_delayed_work_sync(&ar->recovery_check_work);
+
 		/* Clear recovery state. */
 		complete(&ar->driver_recovery);
-		atomic_set(&ar->fail_cont_count, 0);
 		atomic_set(&ar->pending_recovery, 0);
 
 		if (ar->hw_params.hw_restart_disconnect) {

-- 
2.34.1

