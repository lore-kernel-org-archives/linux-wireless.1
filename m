Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302466;
	b=aBwImskesXPicA8o+Cpy8m+BIWFvAu6/NwzGQESCSnshvFlitSto+WYFS88sx6sfzvQS
	 77kZV/EzYuyNvINIKRMPI2VHX1UB9uYp5yoouaJUfjgbhyYwzVhORsjgZjJWuScItkMgq
	 eNbwSAO+h8kVIA05maFJzYqZS/1V+8FtLvFhdxdTnsuBkcCwDKBLacg4ZTWCHDsUrNTy+
	 CRSgByqWcI3lel3xjmcuicU8IdpCoJfAPZZtszfdG1WEL7cmoLNKzl6/eb/TDPaAnK/tI
	 qIEKe3H8RrCsCYsBLm4eGrXif7lS7MdKb/XLRPR82jWL2Fs0j31MOqMfYvFb39kKMbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=F8ANKK5K18HEbCqMKoJNZuWBCRpXtLBYrpTOrUncVlM=;
	b=xVoKNhQ1znz3kA9Bb7yYwECpbok8j4YGmjH3H5J/KHfLs+8a/sQch15/KgWJd1HMpQ8m
	 NWScW9OTa78PhGlfQBxuEQWtA42Tto6DySOcQwcfZtP8KF25FONmKjKo1Y2OJ3c/ZhSJc
	 bId9BfMXe0wiSl3L5Sx6m9d55LTdGf1vkEmE7+3JyEZZktr5l29IOcSipJt0TUzOkMA7q
	 ld5Fvvhnd/6GNaMuNZNZQZ9CldsXRj29DgJu/WBcG+ZalLZCmogYQMaSPcjIzqWWcCT0Z
	 VtJ/8DbR1mp7JSmNWc/rGRm0h6KAv6cbpqd5vCJUjGuXm4TAymgBprr0MK7B3daQulg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=YLxvM9lO;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9253360A2609
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 23:07:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9253360A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=YLxvM9lO
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4d21051042so360321366b.0
        for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 15:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795302464; x=1795907264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F8ANKK5K18HEbCqMKoJNZuWBCRpXtLBYrpTOrUncVlM=;
        b=YLxvM9lOh51yCpThdfwiEFEza0K0dYbM6wXgu35tDqk9pJVZNurcEdUfrHAG4KdW8i
         gy5WSOOJvTnPQ41t+JSOFPdJYQw4hpfyYHN1QuhZTB2kej81RiBecSKNfnDBiqgRr50F
         BXHpDMdSGvkIAPbNE4ACf4GvtnnobbyjMmF1WNBfdENu9zbuPPex9TXn0r7uZ2f87EzU
         X1P/6ouOx8XRqmo1yxiyj66XUXmLsBI4rXm0e9blG7WAWds60nLD9Oe/lTJg8ysm/NdY
         CxOWBaiyBE4CO82RyRRyZTuXRvjCyebss6snAqmtRR9ktbqGmR/FTMTWqdBd2uHWQmWt
         F0pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795302464; x=1795907264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F8ANKK5K18HEbCqMKoJNZuWBCRpXtLBYrpTOrUncVlM=;
        b=DbxZKkjrP8aIrwrYkMzs73gs3yNQuivvOw1J21HW3nYdtFxXibppLutmQoz0rRD6p8
         4TDk08ZvAWG3MRvZ66tzLCkuP5jCAOxFLE+jEvhSpznK7JaDNC6hFU0wVr7Wqpz/zJX+
         rwTh1SOVaRgotRcmAo0UhSq6Wf2xYc3W2aJnAq3kZV9hJrh0saoEkjlb1oxdG+RO53rB
         NSTSSX3dLIZX7BZpIrv1xAs3WpCtrfplAmjgMWrHNTcsUR6lP+afie48WMCiZCspEOdv
         h4H0ndMP0pG6Vs/+3pbr9Cj0a/3iNi2TwZPYHEWcPGTzygpLtIcCJ2lBNsYzzknrAX9N
         Z6mQ==
X-Forwarded-Encrypted: i=1; AL+hErElv3qAxfo0g7nWVWCdB2HgGrBp7ar0gimEwrVcKfMQEwVsWcVO47UyQSBGdlijSZB9U8ysoWONes7OKPVmfw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9H4UqfnEMPyLeMhtev/Lb4L+SN9xZS6aIlKgSw38lU21yUlOC0
	/cLMiEGoslqNnfar1JJczD50yLG1WtyrjCvFnHm+0Qq6KlEn+WkpX8/+Jbkg9ozFrQ==
X-Gm-Gg: AZFdTZcYForOJjgvE0swNZ52Fc0TNrsiKKbVvq/35DkMOSHzCy2Od4swAMxnR8fJGwM
	/AnJZ3/DzXnQwzGeG2ANleEinT5/I0631qwW3F/3bVlB24Wyh4gJppNN+tXafx/cuHCHOsm9GB9
	18swXYTGHx7ACSoPHrHLFELAUHO11uTRTjhZ17xOOO8+VQcPjPBnM06gpFaR2AARdOOnItNP4Kr
	d2+rFCRGA7feOKSzzLigefWZ0xEVk8lhKFYGEmv4Bws8nCHTv7KUf4sNGvtS/YDc82OFMstVF/z
	LxbDwrhKgT8Dkz6hCWw/J4ZtVGhQPosC//chMKopLgzFOhuJqZlcTQCpuuweFX2KajChtb0Mtlh
	MIT0mYvdSBL6PUWxUTK1nSKVNdA2zkA3poBYaOpCz2hA1Z5BIWQ0RsjxIkPE0VzegJt5wWeD8+H
	kaYXAOJFEqjAAiE4qd9HYbOJlra7GmYSueODuSn6cglD5fDCVwhXT9YR9P56LmNHoXoMapAIRpR
	H5ZOwj1ASmwIrA1Ccz8H50chAOaBR7QrpLDWQEz3TAqIyw4Nn2BookBNkTRYXDbRjJEDRgXHh5a
	BMC4z+ZdLF2MUc+bjGnujwNjxf09tNiUGytTRuOwtYarTS0OYijBZWMEdcMXEaF+BY5Dfwdhb6x
	6ifkoM1IJ/xetqXMNAp6l9D/t19j1Yd5KzO2ubIextgklhoXoofi3HaWHSrmtXjBFg7GwsSuMmI
	ntKvxyHmjRYA7AXLtG9ePPIlPYjRLt1aKZQe5+DEPaRUxwM4eJSpqVOmrieSQPPNw37oyWPQu5i
	QFznGGFc4Raa//WNp1RzXnPo/iWULev1wpvAKdBmQTDi35X1ypCiFe/974SSMBJFS7P1rpwA/EE
	EAEOVHXiTXZktXpENzioEZGlhLl5WdgSvgKvS50pzIvEZmQ5Bu7lsCt5BZd6oNYOkc41YeP98Fg
	=
X-Received: by 2002:a17:907:6ea9:b0:c2e:856:2a08 with SMTP id a640c23a62f3a-c513a3a6598mr657443866b.1.1795302464094;
        Sat, 21 Nov 2026 15:07:44 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470edf0034412c7e8f5a5e7a.dip0.t-ipconnect.de. [2003:f2:470e:df00:3441:2c7e:8f5a:5e7a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc1b40sm242721466b.54.2026.11.21.15.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 15:07:42 -0800 (PST)
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
Subject: [PATCH ath-next v3 06/13] wifi: ath11k: don't disable ext IRQs twice
Date: Sun, 22 Nov 2026 00:07:24 +0100
Message-ID: <20261121230731.1206043-7-julius@bairaktaris.de>
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

From: Florian Maurer <fmaurer@disroot.org>

ath11k_core_reconfigure_on_crash() disables the IRQs at the start of
every firmware recovery and ath11k_core_qmi_firmware_ready() enables
them again at its end. If a recovery fails, they stay disabled. The
next recovery disables them again, so the disable depth of the ext
IRQs goes to two and the single enable_irq() leaves them masked. The
DP rings would then not be serviced after an otherwise successful
recovery.

This is the same kind of imbalance as the one fixed for suspend/resume
by commit e56c9d429ba0 ("wifi: ath11k: fix unbalanced IRQ enable/disable
during suspend/resume"), but caused by a failed recovery.

NAPI already handles this: it is only disabled if it is enabled. The
ext IRQs are only enabled together with NAPI, so only disable them if
NAPI is enabled as well. The pcic ext IRQ code has the same pattern, so
change it there too. The PCI CE IRQs (ath11k_pcic_ce_irqs_disable())
can have the same imbalance after a failed recovery; they are not
changed here. The AHB CE IRQs are not affected, as they are enabled
and disabled through register bits without a disable depth.

On IPQ8074 (AHB) this shows up when a failed recovery (forced with a
test patch) is followed by another firmware crash: the recovery reports
success, but TX completions stop, TX fails with "failed to transmit
frame -12" and the firmware asserts again repeatedly. With this change
the same sequence recovered 3 out of 3 times. The pcic change is
compile-tested only.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Fixes: f7a74e131d3f ("wifi: ath11k: disable interrupts during firmware crash recovery")
Signed-off-by: Florian Maurer <fmaurer@disroot.org>
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v3: new in this series, from Florian Maurer's series [1], unchanged.
[1] https://lore.kernel.org/r/cover.1793531790.git.fmaurer@disroot.org

 drivers/net/wireless/ath/ath11k/ahb.c  | 4 ++--
 drivers/net/wireless/ath/ath11k/pcic.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 27d01411b6e9..3ff7d5f27f5e 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -235,9 +235,9 @@ static void __ath11k_ahb_ext_irq_disable(struct ath11k_base *ab)
 	for (i = 0; i < ATH11K_EXT_IRQ_GRP_NUM_MAX; i++) {
 		struct ath11k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
 
-		ath11k_ahb_ext_grp_disable(irq_grp);
-
+		/* The IRQs are only enabled together with NAPI */
 		if (irq_grp->napi_enabled) {
+			ath11k_ahb_ext_grp_disable(irq_grp);
 			napi_synchronize(&irq_grp->napi);
 			napi_disable(&irq_grp->napi);
 			irq_grp->napi_enabled = false;
diff --git a/drivers/net/wireless/ath/ath11k/pcic.c b/drivers/net/wireless/ath/ath11k/pcic.c
index 2259adc3bbdc..2e7dfa8388b0 100644
--- a/drivers/net/wireless/ath/ath11k/pcic.c
+++ b/drivers/net/wireless/ath/ath11k/pcic.c
@@ -455,9 +455,9 @@ static void __ath11k_pcic_ext_irq_disable(struct ath11k_base *ab)
 	for (i = 0; i < ATH11K_EXT_IRQ_GRP_NUM_MAX; i++) {
 		struct ath11k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
 
-		ath11k_pcic_ext_grp_disable(irq_grp);
-
+		/* The IRQs are only enabled together with NAPI */
 		if (irq_grp->napi_enabled) {
+			ath11k_pcic_ext_grp_disable(irq_grp);
 			napi_synchronize(&irq_grp->napi);
 			napi_disable(&irq_grp->napi);
 			irq_grp->napi_enabled = false;
-- 
2.53.0

