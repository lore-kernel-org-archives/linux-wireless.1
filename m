Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164180;
	b=AXVCwsyftYauH0e8XZ5R9LEgEHwAZ3d41j7C3sC2neaPuyB8CM8d/AljryI5KV1+rx8N
	 AFmMHHb8wYL6cvP+/XaQX6zkrgvU7ajpElqeb/dOxblZvHC7Ce6EJMgRRWq1moLhGUIkA
	 y/EKh78tyNOGgGn5hwlZBx5u73zkf0+FFCoGEj/Zt4JbP7wDYrzpLxs4r3iG6CZfaefG1
	 HzjqYwXrUFOXc61bYI4E4IxBF6WWde5Kobtb7LtFhxzlASsqZLMmri/HUcaTo6uE6fYKR
	 z0mUMfCfMIrhAvTBkYsFJNCZHBBUd2lvUe8bwUId7zxKXmkl3B+DLkCKVGkvzfn4pCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164180;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=C5YwICipISVd2g4uhLIfNBL06erlc5jEPBJSt3vz90o=;
	b=vZfdCiiJoCw8UMIHTrZEnfGMNIv7XnMhVaOdUzZ5ViELtjn4THtUabS4l8YN/Jg3EmZY
	 AmlzBf11X7jXayeB23xhnByliCMtiO3UQkaPpJ2enyhbqcXeU7HKlBunA2gaHmmWahnXo
	 B06X4ZtrH1WUj4rQh27SOKoIjcCtngIx2ePLlw5YOaB9rNmV9s7Hu2GblkPYu8A22deG9
	 e0Cttix0Foct5V7DNcaue0VuOHLtJr0Cbwcb45QdmrCp0g9Zc4LeYgf/AhS1NJfk1Z17p
	 5Myr1w8gFRxrf0hDaLaJ3xtRpK2KlMvcXjRVvOuEf+GXIf8MzSkw8dAk/CSAViDQDgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=abit4y5V;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NcRsmMPj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FCD60A262A
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 08:43:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87FCD60A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=abit4y5V;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NcRsmMPj
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7etKm3575575
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 08:42:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C5YwICipISVd2g4uhLIfNBL06erlc5jEPBJSt3vz90o=; b=abit4y5V+T/Jq5g4
	bYmNSeylkyJMMN+uwIdCqFRf6bySXOoO+UU6CYz5m3W998OQYAhsoMWxBkmFr3Fz
	Q7kn8kRbngUJjAxHLV5NJ3QqUi8MLdXiuHyiCCQaTGSzoX7VoP29KCWWDrzEpqSu
	wVdFPQ0EmRM+va9rT9bCivog+vTXlehWfknEPrmcbJ6Bl68HLUHgiR6eYsWd61aK
	R9TqpbAE5WONEqgfhD6liFhB/aWWyn8Djg3RnMjXjNvKD8Di3eOK05aBIwuTLn9t
	muxPOe3KFbCNBfkctiKnR8NdEPTs/9l27kyyENGwgd+DEIs9uxsBlO/GUtxRjlZM
	ugLSzw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2gu80hsg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 08:42:59 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso785370eec.1
        for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 00:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795164179; x=1795768979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C5YwICipISVd2g4uhLIfNBL06erlc5jEPBJSt3vz90o=;
        b=NcRsmMPjfFeiN3l/J37NOWddrg4jDfEuMZFl1LaxXCNzG3uhvb0og+V3vn0Lgy2Cij
         IbAuMO2pXkYtg2rR7zGb941aoZ8FSQvyPpKM0ngbeDxOfbSFZ3HZX66HntkWYF80pm9N
         +uUq3We9xxlylqgwXrnMJ0OhPfkg/uMv9w+0XmZuW59bwdqCHJAkdQ+3BPK2rFvLsNML
         QW1tkm1Gb6Xf9w+X1vQqtIepGjHWhsGTJ1FX+e75PqqZB7hrbva7nZeri2rNiX0BEbJe
         pWF0AiOY9bp7+3WZVNZCcNdgbht5Jfsty6yVKqtElbofr28OpO1v973mNrO//6/esTNU
         RICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164179; x=1795768979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C5YwICipISVd2g4uhLIfNBL06erlc5jEPBJSt3vz90o=;
        b=f0iLHrWhiK3hYPPo8x9HUYVlIC1An3SssXJXYEyjThym4AFWWTwJxRPC9zFoAqpjgd
         4GOS6+HW3oiHQx8o1LlJoumDfIx5j85XoUJXLGNSQieR/WTh/w4nAgFBnZqvbo8FImim
         o3jSK1Zzj5MCvBl4mAmslSRgnW7YUT8Hk3EMW2j94LtyUFuxlf6a5ze4G8FEBQGvYmo5
         2WoKbOGrfCvk8U8QXr2I2WGQkAtWRBLg8mqQKEkGwAjnCzGNLtaDOEXVrBbUsl+3E8Fc
         5vdsGqIqCQNdk/LSrysqY/BOugN8CmoXf1QCg2OQSq0KJrcCBWsUdUyup4AxoLXgIKU9
         ytsA==
X-Forwarded-Encrypted: i=1; AL+hErEvtT4kkYvNRdh8aoGD5vj91+E1vUQFcE5pHAlC49BANa2yUdAVh5rEw402oyfj7MziopSnhtwVNDfzvjqoOA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9ChZ3E2U4alp4Elh/o09V3BZ+7pqHfrqPp9KunW7JpCNDAdCd4
	RNeWxJwFP2bws5Gz9GPdzStP9kI0nCj7ucH8pzhVifbwY8xnoUQPdB3Kj746PEiTVzUH3fiQIsU
	GNVCABkynojqcnHlnJyd/ZOSbgijF9AfSFc0xaIljnRrjUqftWuRdkCpAM18s0tZsrQNNOg==
X-Gm-Gg: AZFdTZcEaR5SjxNsuJCM0x7ZT7pru6A4q3FGrvI5RiiGEyxJNTXWabafSNdOWzKF7Cs
	r1AKEfmvKaICuFEz1WU3KXMiUHLLBm1H+MSsJue+8xxn7M3/Z4S+VXQ8OICCKJfv3ucXSQK+qqy
	dY8Lq66Kt9WLfATPk3duFlNCP8uv4ADRRPI7QSf11Z3A87EME315IUbrBKYu0AA1KZ3jcKLBTA5
	iNumwi1iMJTCi/6V1ClPG1hj8N/7cpmy+qtspz7FVvbPJ9kRoblXVuofIPXrxuHsQxVpwQ45Tks
	ae25wEan/uv7k+C3hnb81Lzcan3O0fTDD73UVJ74rOuP7VM4XC5sEcgnyid3z5GogW0Fy/mKbK5
	wMqnBp4/XkWrBx/lO9/spe59AZScWfidVvCwjmL3SS9LnR/77voNuzS4m2WWvd4Wc+TXJK+xyPD
	vRudfE2Xl/u4ykQEHOHHb+pHM=
X-Received: by 2002:a05:7300:ae10:b0:381:e45d:be08 with SMTP id 5a478bee46e88-3856fd5b980mr2097178eec.21.1795164178940;
        Fri, 20 Nov 2026 00:42:58 -0800 (PST)
X-Received: by 2002:a05:7300:ae10:b0:381:e45d:be08 with SMTP id 5a478bee46e88-3856fd5b980mr2097141eec.21.1795164178380;
        Fri, 20 Nov 2026 00:42:58 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm7326352eec.5.2026.11.20.00.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:42:57 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 00:41:31 -0800
Subject: [PATCH ath-next v4 06/10] wifi: ath10k: remove now-unused
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
Message-Id: <20261120-recovery-v4-v4-6-53d6a04490e0@oss.qualcomm.com>
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
In-Reply-To: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795164171; l=3570;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=CD7fmFScyWmCmXliqMDV2hy5lqRMI4cysjAMW/TR5lU=;
 b=2B1npwMUS7zePVx4vFq0hPjvBXKac1jjnWW6gNTOLTepG/z9MQzkq+HRAPmqrang33r30q8dm
 67tz52dnXHDD/RpQ6H4SK+hYMZRgR4klXE2JGCtcldWOvWzDAo2yS69
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfXyNjFlzgffeTp
 2PYZZS6RLvYvmG5/nd1wORuj15LBm+e+G4uKztR4Mgc5ogrzo6an/mLtrO1qkop/CL8eJ+GADRs
 FFxTr5Pr7BPbzquwRXsmAwqXphRCRm0kSRQlibg8fvRhtvXBiY2F3+xA1jOmP160+os8dlh+kuY
 GlLjSP2PLSN7U+4OaoJiDMFL0wAcz3fDUx5pr3AITIY/CaXOfAm7g+Oksvt66esMMxrlqTia4fr
 KXD5yQ3OQ/Zbpp3gcWqJTIV05iuLBUhFJw+DsUEXKvfw5Cct/Bfyl4aZeTwfBGSKT1KhRdfg4KF
 H3/75HJp8flf6BywIj3NAZFRbGYvkw9JGUcOZl4GRPBzJxsopQPlKtS7gVhGgVdcs4vYUMhsgLi
 XDiWt0miNBEDJMEzna4Ok8DG7Y+XQaYHdpdEGHjHDfPeVEat5KvpYvnN6Yqly1899TeHbEyNi+q
 /JSbqoI/SnLWVG19XqA==
X-Authority-Analysis: v=2.4 cv=bLeDs/+Z c=1 sm=1 tr=0 ts=6b000813 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=M1ZKI_MSFVluud-aX2IA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: kw2SizmTZCizNmqc9ORpY7qeGF52qcYC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfXztlqTXtVaK2/
 M1vxOrDujlDU2vy0bDNi9etSNxqo+D/I6tuKkXTJTIvNUzuxuRovWKY+Q04Y5r2kngNGQde6IvN
 OgqCN63umI83xrXz3SCsDjrQj9Lk/aQ=
X-Proofpoint-GUID: kw2SizmTZCizNmqc9ORpY7qeGF52qcYC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200034

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
index 676f9657b032..ec19c4ca360f 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2646,8 +2646,6 @@ static void ath10k_core_restart(struct work_struct *work)
 	struct ath10k *ar = container_of(work, struct ath10k, restart_work);
 	int ret;
 
-	reinit_completion(&ar->driver_recovery);
-
 	set_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags);
 
 	/* Place a barrier to make sure the compiler doesn't reorder
@@ -3752,7 +3750,6 @@ struct ath10k *ath10k_core_create(size_t priv_size, struct device *dev,
 	init_completion(&ar->scan.completed);
 	init_completion(&ar->scan.on_channel);
 	init_completion(&ar->target_suspend);
-	init_completion(&ar->driver_recovery);
 	init_completion(&ar->wow.wakeup_completed);
 
 	init_completion(&ar->install_key_done);
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 75ff555173b2..9175d0080ab5 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -1065,7 +1065,6 @@ struct ath10k {
 	} hif;
 
 	struct completion target_suspend;
-	struct completion driver_recovery;
 
 	const struct ath10k_hw_regs *regs;
 	const struct ath10k_hw_ce_regs *hw_ce_regs;
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 695df1821e5c..a213d8c2a8e8 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -8186,7 +8186,6 @@ static void ath10k_reconfig_complete(struct ieee80211_hw *hw,
 		cancel_delayed_work_sync(&ar->recovery_check_work);
 
 		/* Clear recovery state. */
-		complete(&ar->driver_recovery);
 		atomic_set(&ar->pending_recovery, 0);
 
 		if (ar->hw_params.hw_restart_disconnect) {
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

