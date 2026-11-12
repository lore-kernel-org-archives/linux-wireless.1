Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482798;
	b=frV0An700kMu7i4rCBzMpapv6wMPRYMaD1kkv2oXnXZyOnl/0yQM0NzAiYoSFZelk39G
	 QpRPql0F5Sg3M44HjFECqysO8rk80Z49qEI3PmhFUAYhEpJ8dT8AyHLyPNRA+l8J92ENo
	 jHQYWDBsmTUWYQSdlskExNbq6PlFAHCee28TZ2k3BOfK1QPMBvsYd9OPHjuoSq1Iz4vTD
	 2jZeVHEnCwfU44VS87mnbPqSIsk42sxNWrAvKaSJuoHrONCjK5PD3SRMJG01kY+1BIIUh
	 llHzwBmzFHBOM2Z+AT4Fx+eF61Ww2CVHaSIN63DZWjB73ewzR34YUAPuT5mAJOK0Wtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482798;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7tqiyx8gT9s1uWX3xJB16R4tmdUJMTAe8h0BjVdNGtc=;
	b=2amIkL4juBqofueo2myIQPUFKH3lQwxtIO4SiHC8AOxAxkDemcgJiwQkJ5NZis36lStZ
	 LMDHFAlw5x8N+KgoasJqFLApGomFY2QyH8g7AtifMFSZc8tbv7PyfqVhRTDfoXuIDXGaC
	 dM07J2CMwK4upsLX0qM0xnNncD9sgrUsI3yc77LeaCDJBoIjhyDeZXXN4yU5NVx28kiGY
	 Fu/PVzXOCa9qXMC3Tfz5NmCNBh07p80bgmq3DjvqitJzvIS03n3xNBn0yYX0jUSiym1Tg
	 5NSXscTpNlrN1ft+MGLir/Ob0gJyUpxpVcKjbngt/ZjJxWbrlT17Rne2TK8tqyMc3Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PW6iwmlI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lytu3A5a;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C028560A2633
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 11:26:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C028560A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PW6iwmlI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lytu3A5a
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACB8FYL3477109
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 11:26:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7tqiyx8gT9s1uWX3xJB16R4tmdUJMTAe8h0BjVdNGtc=; b=PW6iwmlIY0wJeZb4
	jNbKtoLiuKMPerhdmUDus0qfuSw1osFZ9xMiZUgnERyfCkPnQ8Kz/xZpSeqQF1dy
	URuPt+XcGFinoH3uQ1sJomdeoUWGbEngr8Xb75RVjm9/PdgcTfDpo2gY4/dq+kL7
	2QYf9wmpf69pDrXlXAYQFFdL0iUKTCxM1JfXXGao7IiZnafMMDdH4sLKFNVvJh2H
	BY07Kayh+gPvRFrW6ZRSdyro5/s/hEwJ5amZJCdWxAyZehlhnbu65nshOztb+Wbd
	dwVZLBposjWPcxMVfrdj2jRFwVP86b58IwbIpNBsy3syjKHOgj7BZNx24FbAsBfw
	ePbZ0Q==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6yuha0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 11:26:37 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b3b63b9665so1589428c88.1
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 03:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794482796; x=1795087596; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7tqiyx8gT9s1uWX3xJB16R4tmdUJMTAe8h0BjVdNGtc=;
        b=Lytu3A5aDd5UY7W1bXigzGl6UqJ56HOeMXfDp2cng9iN7jiERGKCl77dyW4XLykPmd
         Ot7M0L81Q6YKs0inISA7j0CtIVSis35Rff48PoY4EPD976HrFXONa+rRltVfULVJaR51
         vKSdpaUwZudq0ro51e6L6UYwHtLFSLcqeKI5QtdlfXN8dZRXZIJiyMJF2rhGdobVnMhG
         AKc77j6xUWnIKY7ioZHJ3qMBUXz4+XZYBU7Acs+M2IzBcmo6m4q9l8ODvKxqOIplZYd9
         8OfZnL3WMI9ujw0RLAUWRGYmYeI7HMQRpJ96cSGMOSyv7OIx4zVoVIgTodOclT9CzaW/
         WUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794482796; x=1795087596;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7tqiyx8gT9s1uWX3xJB16R4tmdUJMTAe8h0BjVdNGtc=;
        b=tNT4HHG+Tm+gj5GsT8igJ3qg/m3LlbEeleEsqUEfHPqlXlbvAuTmNl8iiWsnZVEbZl
         AEI/ruXWWkmPFJJJ6ZSjxsUob9BWoQsxlwgDgbeZRVZpNOfPH+nvGCYfxmXM2PwdLRsl
         ak9T1NxVjQpE9lKq3U0fCUVxFKt5kMLC/jeewNX8ztLLiV+InOBfr1KI1hi/QvgtXV0x
         MSyZZd7awU9Rtyw7t8u9ZuuLAGNMrilEO7W5PecVCVGL7voQ7jDu1ffTxN3/LPr3xkKm
         DpC2nQEkd0He4zNS4NkmG7t6tVEaUgWBGSNPZnPWivzWXUPBSlC/iRmDKSTgWiVf+K0c
         bSCA==
X-Forwarded-Encrypted: i=1; AL+hErFKn979wSWitygd7mNzCTDiiZ6qlNNPqCyIycDzFm4oC1H5Z6NU+JEm7zeedd69ZYk9a072BzfZJfRtxWYRoA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Arymx60+aaKCofEEdZEA7XV0nLq9mKIksqRL0OgqpvO5i+Eu4
	B/Vm9mYja2kLNYHRK4ew6KRjKoTioZR9fKH/5orbjq71n9bA0hoMwfxKWumK/PgPcORU4taL4DP
	dzn4OsIgG+7cMl1rNT7WKPyH5YRnwHZ/xzjS2nUXFNAyzTTgHIpRtjhKQgEjslY8WFUnvww==
X-Gm-Gg: AYBFou3gFVf3xNZy/4rqNsuqljV5mgDZ5IanNRcMDUWva1ohZrmVa300hsDxNxrDOTy
	P532BSoQkDTXWCgw26U9LN2te8MY0ov6mTTIYTODwDYW+6f+6YdRwTMOLybvZDENGBP1+bWG3X0
	FxTF3VoAGXgX2ZIGyD0KKc5+lZsWtz53ocztXTps/yXVTfm/hZYQZUsxYYnb32tGmYskppPqEi5
	JWo/jir4C1vJi6heT41AMY04RXwNCW8/TETG2eFO0kcwkroZzzzYbhvwqSl80ZHn21oKTRbpvNB
	bshuDFeQx0w8N6u3/tfE1nG39zmAHvlxsbV/EMzaZRE5/aPGXtuokCsYSY4RcBCXv5yky7VipPz
	GQJVEwKaCGv/BouFdhvJUqch0mWNmoBzD2GTOT2LA8UerundukbGRJsTqIwDANZr/Hr6xhW/P+v
	T45ETgtvsD2P1d41ryeaglcbL7
X-Received: by 2002:a05:701b:2802:b0:1a8:7b58:6f1b with SMTP id a92af1059eb24-1b3c03179d9mr4221967c88.19.1794482796247;
        Thu, 12 Nov 2026 03:26:36 -0800 (PST)
X-Received: by 2002:a05:701b:2802:b0:1a8:7b58:6f1b with SMTP id a92af1059eb24-1b3c03179d9mr4221947c88.19.1794482795679;
        Thu, 12 Nov 2026 03:26:35 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm30402359eec.19.2026.11.12.03.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:26:35 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 03:26:06 -0800
Subject: [PATCH ath-next v3 07/10] wifi: ath10k: trigger recovery on PCIe
 MMIO wake-up failures
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
Message-Id: <20261112-10k-sdio-crash-v3-7-24f03f300bb2@oss.qualcomm.com>
References: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
In-Reply-To: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794482788; l=3505;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=8sf0rAmeCFvmk0B+SaOwK1SuISp//KMx+nDrAcdmPS4=;
 b=N5sl2Mdpvr96xS5zyBkY8ux81+7tJBXwf6M8xGKMNNmyxxkJ2+jVcCbrhKGzfTtMbUupYwxrJ
 mY8Dxy4uUJuDFGH0WN2RJ8iL12iVVWmN7A9eOSbhgxwI6KtrZVia92X
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-GUID: wmHES9Lne_MRdg1WUnwsS1pGdChDOICH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfX7tgjQu+cFrCm
 vqq0ssNFNMJ03IgMTl3a/Gbcrb8PPqnK7WhH1oQZxdjIZYoJYbaw4JNKNTaqZ1nipUTOT53JT5a
 TxBEc1tVGn0bnaaLLmyRq1i1O4Un1Es=
X-Proofpoint-ORIG-GUID: wmHES9Lne_MRdg1WUnwsS1pGdChDOICH
X-Authority-Analysis: v=2.4 cv=d49gWhjE c=1 sm=1 tr=0 ts=6af5a26d cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=r31ynADB2PxU4kuVuc4A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfX6UCMYkZdf7TY
 SkCPgHCjCUhHx2Meg8IZIht8INv8uwwNlWrHpcAvQZ+V9XHBrl45mar2iksyRY/UzJPgkTEJCrH
 lQBqbZl9Jxz1P/PwNUXspchKhAMy1q6G34jA87PKs4Vp5amk9+hjb0bwWa6Dah5Nr650Hf+GvAk
 KpMgfl2Yw69oCwiCPyvm3I8jRPiQlfjcKUzHYLxvFikvGVNnAOYAoAN9Gbhc/ZE25T244SLBf0N
 s5kZlT28dTVF00dUhk7MOemBc2op/mdwdMDFa3CBY9jLaHHmvT9A0nJ1pC6vUcMcz1E2kCDHGXJ
 at9PUxMDOq3Has7eNl8M2Wjiw0Wzd8DpGozErr+oNjZgPiyDtmfrb5ck+is0T4PL2xotgpOGM5e
 Av4gSfQUcUp/U3MMQXwaZDkX2nn0Tdc1ockZnkXS4PfWaiMbAhX43VNfihWfTPAoG1cnvwY6SfK
 UaCAZrT/IHgFdKDkHbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120045

Commit 77258d409ce4 ("ath10k: enable pci soc powersaving")
introduced MMIO wake-up handling through ath10k_pci_wake().

The current code only logs an error when the target cannot be
woken for an MMIO access:

  failed to wake target for read32 at 0x00036044: -110
  failed to wake target for write32 of 0xfffff81f at 0x00034834: -110

When the target or PCIe link stops responding, an MMIO wake-up
failure may be the earliest indication that the device is no
longer accessible. Since it does not trigger recovery, recovery
may be delayed until another path requests it.

Trigger recovery immediately on MMIO wake-up failures while the
device is running. Also abort PCIe wake, BMI and target-
initialization waits once the device enters ATH10K_STATE_WEDGED,
because no further hardware progress is possible.

This triggers recovery earlier and avoids unnecessary timeout
delays that may lead to suspend watchdog timeouts.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Fixes: 77258d409ce4 ("ath10k: enable pci soc powersaving")
Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 335bc7c488e4..0c671630cfc9 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -478,6 +478,10 @@ static int ath10k_pci_wake_wait(struct ath10k *ar)
 			return 0;
 		}
 
+		/* The device cannot wake once it is wedged. */
+		if (ar->state == ATH10K_STATE_WEDGED)
+			return -ESHUTDOWN;
+
 		udelay(curr_delay);
 		tot_delay += curr_delay;
 
@@ -642,6 +646,16 @@ static void ath10k_bus_pci_write32(struct ath10k *ar, u32 offset, u32 value)
 	if (ret) {
 		ath10k_warn(ar, "failed to wake target for write32 of 0x%08x at 0x%08x: %d\n",
 			    value, offset, ret);
+		/*
+		 * wake_wait timed out; the device is unresponsive at the
+		 * MMIO level. write32 returns void so the write is
+		 * silently dropped -- kick recovery here instead of
+		 * letting an upper WMI wait notice it seconds later.
+		 * Guards confine this to runtime; cmpxchg dedups.
+		 */
+		if (test_bit(ATH10K_FLAG_CORE_REGISTERED, &ar->dev_flags) &&
+		    ar->state == ATH10K_STATE_ON)
+			ath10k_core_start_recovery(ar);
 		return;
 	}
 
@@ -665,6 +679,9 @@ static u32 ath10k_bus_pci_read32(struct ath10k *ar, u32 offset)
 	if (ret) {
 		ath10k_warn(ar, "failed to wake target for read32 at 0x%08x: %d\n",
 			    offset, ret);
+		if (test_bit(ATH10K_FLAG_CORE_REGISTERED, &ar->dev_flags) &&
+		    ar->state == ATH10K_STATE_ON)
+			ath10k_core_start_recovery(ar);
 		return 0xffffffff;
 	}
 
@@ -2248,6 +2265,12 @@ static int ath10k_pci_bmi_wait(struct ath10k *ar,
 			goto out;
 		}
 
+		/* Stop waiting once the device is wedged. */
+		if (ar->state == ATH10K_STATE_WEDGED) {
+			ret = -ESHUTDOWN;
+			goto out;
+		}
+
 		schedule();
 	}
 
@@ -3308,6 +3331,10 @@ int ath10k_pci_wait_for_target_init(struct ath10k *ar)
 		if (val & FW_IND_INITIALIZED)
 			break;
 
+		/* Stop waiting once the device is wedged. */
+		if (ar->state == ATH10K_STATE_WEDGED)
+			break;
+
 		if (ar_pci->oper_irq_mode == ATH10K_PCI_IRQ_INTX)
 			/* Fix potential race by repeating CORE_BASE writes */
 			ath10k_pci_enable_intx_irq(ar);

-- 
2.34.1

