Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164181;
	b=vIx4AtPIdlJGEnf2TByIJvKutkGwFcbC9mdhvmfuw4DiFKDHRGa4LlXgagzcUblI/muU
	 HfpQPZbe8Qn4lM9FhTlXc3bTdgbU5fD5s/yH9zTEe5gvF9H20Rc2203LmPuyvSnNNXYJS
	 BL/rTUFKggRbEyqaiYnKSct53tfMW4eU/x6n2r0GVZ9pIuDqPNKjjYNGeTkPirYbWpjcv
	 AYHbl6AL9hGp/duYzRImMdXkb9m8E0qlsVi5Dyzx/Ox73YgiuQqOemfek+LIuJjWdhkxq
	 tMk0babuCIwlGteJu/VZQa4ipB8wfOygGOMPeHEWyNDgTuOua4QD+ksDc7qHtIjp5zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164181;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7tqiyx8gT9s1uWX3xJB16R4tmdUJMTAe8h0BjVdNGtc=;
	b=aCK3QndBTZiyxaPNo2bPF1sQVIPUds2xwIUhAGZSJXRwtFC+54ZPlgFZ8nS2X0iQMyj0
	 X+I79o3IHTMsN/vIyhRhBMENnwSybgEWTppQK7v1UjA/ib/mXvsFrOMcxuGRfIzK4COMu
	 wRofwVw5GbrW+nEY7y99Ubl4gQyJF+NkMRug6swnB2ft5pWaZOIUOeyj5ENuI2+35BMwi
	 72JwID3jg6zdG6DHvvvq3SRXRRduGjASQMYnk8udY8NnuVYUgoRpUNfLC8Q9LnHu37NLP
	 woEncH+N9W7H2xwfQ8883sQst2sQkRYgcrhoSkU+Z+D62mRa/9z8kzOT6Glb7uZ0kRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jymF+Jlb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GxDYk9Ph;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690A760A3802
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 08:43:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 690A760A3802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jymF+Jlb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GxDYk9Ph
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7eqj81268332
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 08:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7tqiyx8gT9s1uWX3xJB16R4tmdUJMTAe8h0BjVdNGtc=; b=jymF+JlbJAQA2ODU
	dNJEgJWuzOyjs4i11FyI8zA77NRgIVzeVeMB7IvywqpLqZZ4Ep9xMFe7JOIM3eMw
	tsLJ1QbzVPOGIewiuyvQiwh2ha8EHv1ozcrQkgsET2l1UxD/6SXzlFPxfdi890uv
	BOdly3iMIrA2GShtJR0YgECwJlcrAP3I8w20VL6jXa4wRwLKvmVhXTmHvQZnKZ07
	vSoPUkv9snltqfUDgqqUxCHGW0I/TF8L7tWpFe7Mes3ZHh00OPYI8T+u0gFjWOa0
	FXDvFKcIKi7BypYLAx7aXomuJ5bLXT2fq4zGjE94ffISBPGXWqPvm990RgpW9p2m
	Utbslw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2cd1sgv4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 08:43:00 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3854627c1c8so897597eec.1
        for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 00:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795164180; x=1795768980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7tqiyx8gT9s1uWX3xJB16R4tmdUJMTAe8h0BjVdNGtc=;
        b=GxDYk9Phb1Hh9zXsBWNkGuFAAHyz4YSLmtiHK1Np7jFoNijXYoSeHkSLOJnMSMesdq
         ufpJn2R0c/TgtIE6MfuahDDfK8deRb7aJCDqen2q6taysLBKr1INbRnccMd/LM6999Qg
         KK3XRgz6Tcc8fm5f8Nh9nf671855TpcmwQDokgYh8EdqgArr93LbCBurnmu0mOuBd/DB
         enb73HYW8aSwIU4UumjwCEXgaxcT5BZ522ms6lmDp5uME0iHK6zK6uhkwHmLy/SAtkXW
         ZUw8UBgNKHgdHnO6WncyY7iDsV9Zi27BDmpgkSL8Lpl+F1w+orC/H2mLcNjdCK8Kn1GG
         DFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164180; x=1795768980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7tqiyx8gT9s1uWX3xJB16R4tmdUJMTAe8h0BjVdNGtc=;
        b=V5InbnOAVJQ7K/CEBJRUpQgb78BLCa3w4wCNPlKNfnSD4atVsxdkvKm2+7M+hYnAQa
         HcyB8je2hYU3OGWm4x1wVzwKyx8lDRjTOn/nkXUg8lOxgtB+hGMHQ7PBfojtfBBUGNcI
         xiQggUzPgpqQZqdhVMgrCXb/iZ9bDlHzYS5TPJ9Aenm4dgj1ia1T3uI/n3txrisnh3Vf
         fbIKXu3oyXNVTHDJgoWZftB2cqUVFlmvkWYZDWUNEyVu4kcy5OrPbmdB7LuFiNkohBiP
         omjMOR8NkLs7V9teQQ4L5LLc8ux1ZHZjtxLx/1EzRdyhwxAv1KeSaSN5b2/qDLSxElKw
         KXqQ==
X-Forwarded-Encrypted: i=1; AL+hErFxG3ssQtg4GvFnCa2pdUCPmoCi+3R7Vn+Cx9hLNk2A3r65lJtEqZwawBjh4lFU72V9x9XOBBtPk4JvPnZMWA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+dS+es2HcQ+57lP10BhXomCrvAlMzWQy2Iy4fT0CnmpciG7OeH
	kqVvIUMvl7HkVeTAHXhmp/BdxVbEJjkUS1Y1gnOfomae9AUutCYaKlXd0ofeOfLQFWAnToGF0bG
	vgUkl4MjttK+8VqCmZkBDoXweJDCcRQwg/cUECqGP5zXbqBnmeS5JLq1y8KoC2kwSA5RPJA==
X-Gm-Gg: AZFdTZeztc/ravd/ujAMLLI6D9X01pOL9TRMscm6jO/fQQ62lpwk8/5GufK46wUG7EM
	pfUYuJ/rf6Ge3ZD7qVQQlA5lVu+/UJPJDEn395WSTzXDgiw41x+JfCDbqYd9NZ/1YOgVdPAw1yT
	N60GFePd9PJ9DMuGNu348HbKFTBBSli4ww6WBrchf255/W9kcN2Ch3fncAVGbpVYnswAP/1T42n
	309IBNyo58uRNXVHbI1svJcuQ7kfQ1TvzoZl3oL4nyprBCYdpv9ZtQ+m4PSV+qYpHFieuov0sLA
	i1G80DGRWkMwlqJjkm8M6lEWzrjzi1d2CGpwbsxPsAbLc8f71dWp3ppMz+UbeNuuVZk2mRW8lCC
	AeYHHNuOeAdi8k1ZEg+weUcMYV0wIS7gxpzBva87tFEE+ZO5us/wepI7pD6LV7ygFSxIa+2mVu0
	pwjHBdEnunnqBIROPLSJf4VdU=
X-Received: by 2002:a05:7301:1806:b0:381:4b4b:f96c with SMTP id 5a478bee46e88-38570450b07mr2061500eec.34.1795164179955;
        Fri, 20 Nov 2026 00:42:59 -0800 (PST)
X-Received: by 2002:a05:7301:1806:b0:381:4b4b:f96c with SMTP id 5a478bee46e88-38570450b07mr2061474eec.34.1795164179424;
        Fri, 20 Nov 2026 00:42:59 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm7326352eec.5.2026.11.20.00.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:42:58 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 00:41:32 -0800
Subject: [PATCH ath-next v4 07/10] wifi: ath10k: trigger recovery on PCIe
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
Message-Id: <20261120-recovery-v4-v4-7-53d6a04490e0@oss.qualcomm.com>
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
In-Reply-To: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795164171; l=3505;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=8sf0rAmeCFvmk0B+SaOwK1SuISp//KMx+nDrAcdmPS4=;
 b=c5CSFc0PAbTYrFe6noEKoNKEIXHmuFhzTONQ/fJqI5xYZTxPeRXt0SlWiBn1asYALukb7S3o0
 SJHKsBz3ah+Bfxx/OcvizxfPwNg1sf7KL063d1idj2srQkGPX6ZpQ4n
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Authority-Analysis: v=2.4 cv=Dt/Da2/+ c=1 sm=1 tr=0 ts=6b000814 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=r31ynADB2PxU4kuVuc4A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: nynkws2cRhzAIrgpU3kahpCGVzQCotrT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX7QrZkTjta8Nc
 ZFn9Dqepv1tPXOzmQE+Jtr7avPDvH6uwvYvYq6WDRPKisZc8xthkoHhcY5bbeTdgnlLSTl/dPK0
 OyNn/BP1+KWeGbwbMCsKrruK/TA5VAFaa4EyPGLesxkNP0wCPeTvdQAaOLkXRldT88wX+6HKAfU
 YvKim1LOjSNOgdF66leoNLMcxT8ymUajoTJQMUM2Gk2UhWbIO3FZ5oJsdtLvLUSwNC+SKFef6/6
 yTvYGdhqIXc0E4ouNMs4j0S6B3hoO+0nCsgw0Od0bj/7NIKP6FAMtzjNx7ZnTpPuVVYV7hGbyN4
 6G53elbs3FnSq/lLLO0vAIwxGZDP5nuCNCvRnZE0gRUQbQ5OsQxufdiwPAxvtWFA4MgmEy6e30r
 lWUwwLZKM2iP893FozLtRecj/Mfij1wN6CNxwrMclNFIkhRg4Sy6kP1F5a5KAGjcqPXSNYKQknD
 x+DRrptBagfZBeQ4PRg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX7QewrFRVbfjf
 TMQ3WG3ng0TxXqIlFooaSVaRJyadFN3zIo5deScx6Hv18b8SWUmYrFSCSQzb9ZBgNewyl7j9uBB
 /MkzktWzVRk9skXroiVDNWkFP6NC4/4=
X-Proofpoint-ORIG-GUID: nynkws2cRhzAIrgpU3kahpCGVzQCotrT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200034

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

