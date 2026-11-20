Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164179;
	b=2hswCjyUiLLUseCfxzvTMFo8MznlTxkshRkxE+cm4FS0l9pJPbIqfBO4J+fGhnZo5BoQ
	 yVX10eTmYW0fbUG0B+QxWj8pTma8YnzLNb3qEssEj1lW4ERTrjxMcXpxQiXAPl32L8qit
	 a4BLA5Xb8o294qIyym3zqcEVXeMNf36U42SyL6AkMRquylYjNZJ/S7V2TkbAXWAFEt2Mv
	 XGpRnvdzV0X14KsHxRFF+/ccOy5nzRIaKSddxxFOGBvD8QdB1ITvFYWuoiolwQWdhAtR8
	 NBCqLSTkk1EKpNkL8N2pykvSR7xQ0qCJCyWqCTuuWMbwYVFTTXYXoGqee78Qlmwq73g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164179;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Gq1L5L7pty13ukZWKibi8pt1+KwROY5DYn4hDcrRZr4=;
	b=VE4eetL+PUW96jSanZxyWqFVXX6XACvnuaLzzQaVFQ3j9g8gcEHDgCZJXGhrsF6+amqq
	 JrJqaxMYUREeyKiZ9px5vPYsgtYZZBcwczejqbyuPACMh1jvm4TZbR032nJ1oMLCIs0cb
	 i7N4BLHgi65JYRiRhpMBCaWZUwilBhGE0xD3GuntjrTfJ8y9VscW+iE6rr/cmSqx/UQ2z
	 cLXaRzG67sofE4+qq0Mzq7FmZyP3YXrjEtPtIlFtnH1VEwOK63s+RXxc/25N7Y3ugjBb9
	 qRsqKW3klpPabEVLE1FfZNvbQN0wLyqSkqC2cKY/1siEw44gunclrXhmo8DjQelgerQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hOsFZ1x7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HZi65oQw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4121B606B4BB
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 08:42:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4121B606B4BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hOsFZ1x7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HZi65oQw
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7fQhd606891
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 08:42:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gq1L5L7pty13ukZWKibi8pt1+KwROY5DYn4hDcrRZr4=; b=hOsFZ1x7CtTSFPfu
	KjI+6wzyjc5QLrg/seq6JetwneD63OGffpZg52Qmh4j8kyJistMg43AzVergJ1wb
	AOidtDa6X/BaakYDhr5phrTjY63yvgufVJQhd6emyCY2LDlGoR6P/TIOKD6PP9hZ
	RjQJbX5/IHQXVoZM02aZBPODXdrxsLSeqBsqrXancqflAd6vbA+8OKRGIIIqwlRe
	+YJ7DkVYmM/crp9+fScqy/OQm8+QkeUQ1tVr83u/NxAak81IQkbWUEttwusRCNzu
	PpApzH5qprCtiwyB8Wbt8FXxrGEmJsn/xKeoTeCu7T76S5C4TPiRXGuQFpe3gKCv
	ihehog==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqrn4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 08:42:58 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-14373747468so653519c88.1
        for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 00:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795164178; x=1795768978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gq1L5L7pty13ukZWKibi8pt1+KwROY5DYn4hDcrRZr4=;
        b=HZi65oQwu19Fj1wNP2kwQO93gZXwhVwbFDScxvQmTqJBT7dLQ5V1JUFtQaSNsKRdfj
         bsaxNoUDCCe6LgChJhGSaRfKAgms7cZRpespjemm2TSBDW3kng6lWE0njAeCPxa1bL+z
         oO1Se0RBK5a/CbcuXlKAfjUysnhYGQ/P/86a8U7F17T6WmtbJecq2pkVEFEPFfhZUmLP
         i99Dahhbd1nbAcC8vgU+qujEziXk2vnRdHTpRIWPRJ6/THuj5u5YCyIZRyMICh6oYPgj
         n+JkXC2ZMVhAC/+BDMKJEMrkiqpUQceDNs6a0Gb0bJY9g25C9HaIDZL0XcFSlkzOH2lv
         Gxhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164178; x=1795768978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gq1L5L7pty13ukZWKibi8pt1+KwROY5DYn4hDcrRZr4=;
        b=G5HZ1kHWU2rlxsRnx+y4tp/oIOSpp0wC9yYtzQY9JU4C/4ClKqT0w5gwkmLWiARAbc
         AbHx9UCunNj0Fwan8JyQuDCLTddFE6G+W9vdrgOvs2BMYZMu1b3wOL1/vfKZqS/ei47a
         1gfX3KklaBjS6lmlRSkvytXYBrH6G3SPH5S7ndjPelmOi82wiVo4RbJ4JsMXU4fFGMAq
         9uXTvivecvel3uwONJJXcRtIfWxPRCa/XSzWGBgPB8DfboJP10ORHqbNmAUgA/NM2Xb0
         sWzObE15VTK0YHIYzAxcw5c7DlSb9yHmO8dKY4cqYYwZgHTyAr7KgPjpbpHLnoHCwuzV
         582w==
X-Forwarded-Encrypted: i=1; AL+hErH4v0+TwL9ZDB7M4Es43uwetTnJkhxPi6N9kImBFMhPew/jP1V/92F4os3N9wJ4BlofBK5e/egoOVm1PLuWGw==@vger.kernel.org
X-Gm-Message-State: APuU4Z//2F+c5J095cr+MGSSXvbF10WrgyeQxNLmW+A/dfR7MlXkAyD6
	StwCW0autA+tlqykQuS0d/a5vNWczQDMekufEEad9FAVoC0kPlDXc1RO403KeArW8/4zdfySVbv
	XFMeuwce0Kw6a+CiC/QAYyIkpeyc0t4vsmYBbvLh01i1l5g0ItUQbAEyPy60tRd8kT16onA==
X-Gm-Gg: AYBFou2bzqQOnO8C1rfzjoxAUM16bvBUptebKnsBom/MjLBtxttZs5kJ1rhVkS2fYKS
	YODHyjXI+eakOktanUWerdrHWiv3/MTGxGDSYGiCv3eGufyC0nO744ELcvoCxChr9U7wCNAh1Er
	4wqpTd23fuoc+eQCN2TmQC0SqTjPEzCH/98vEmYXzcax3wdwpwIZ/JO2kmTAe+/aEwK6bKmv1Tl
	b8g3wwhgumE9orQTmxZe82JJfNaXjnFL+iPLU+r3veW478n+lGCb7N/YbXzpPGlsUnVmDaOW7kI
	S4rL3cQvaxDP6sHJ6liZ03iSRBzt7fljooqCb+zqHlk4qvaPmSmHM7dM6JM3oBkiY87PHViWFwj
	Gtd6ALjWm2x4ffHX3k6ug5KbpuONpgqiCBkUGj3xO8CbKbmYnZOPw1Lil1XfrCRt8mtudBPuooB
	qi2v0gv37dJL2QygdT7zxvTmk=
X-Received: by 2002:a05:7022:290:b0:1b5:dc3:209b with SMTP id a92af1059eb24-1b5568ac6b0mr2104901c88.22.1795164177805;
        Fri, 20 Nov 2026 00:42:57 -0800 (PST)
X-Received: by 2002:a05:7022:290:b0:1b5:dc3:209b with SMTP id a92af1059eb24-1b5568ac6b0mr2104876c88.22.1795164177335;
        Fri, 20 Nov 2026 00:42:57 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm7326352eec.5.2026.11.20.00.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:42:56 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 00:41:30 -0800
Subject: [PATCH ath-next v4 05/10] wifi: ath10k: hard-block the radio when
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
Message-Id: <20261120-recovery-v4-v4-5-53d6a04490e0@oss.qualcomm.com>
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
In-Reply-To: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795164171; l=1644;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=vdDPtDHbfB+QI9Z7JKCzOpKtIqwLhgBWSgRR6mhsMlg=;
 b=soTE0DczkYsUZBwC88XdOwSYKvquC6brPAd1/W1gp4/bb/O5sNbfzWg9Q4FzEDjpN9GaeBiHk
 D2xDN+bNEjxD9aW9zXqrr1U4pPgeNWMwzZckdFEiinDNoTYgdDdRqwO
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfXy1HR74ev5m2C
 BRvV5DoGZ5EcnUsS6FflMXoKhYLb0yI34ZqGNUeY6EA+doJWs0NXH8RGLhDHyn3UhV+9AJVkfH4
 NMdkCFq6xenxutFL25rapJxGvBCWN6lAdUWzc75MXbLDRulSbLledl23L2rgBaDcXO48fMkk8Vr
 1WbguVuVXo1N6+UTaZCploVNYyAXh3xVGwDZwJm/qoS8ZrYtfUOkw33d81YKr1eQ5uye6ZWoPmO
 L+UYLsSDPm0G6NBPAYY/NZ2+hSNNIfTqoeQAmmDF9xraDe36WowF359oYnBjJnayWrZcNxXW/3Q
 q64ulbrxK9nFbZRGwVt6EM5arr1BL9IfXrjRqJ5n2WXN0cUqtQLZk+6hMCjJ/keNV5poVz0SOAT
 Htj1gInrwJKlo7sccgtVnGC/cWsn5jpMISNJe4BIxKyAXYKNt/MkesQ58B2S8Du5B1nLspFW0I0
 4fTcKRDJqmLce3DaMfQ==
X-Proofpoint-GUID: 1_PVWt0eMSD7_j7jwIUuY4muKxB8aqB7
X-Proofpoint-ORIG-GUID: 1_PVWt0eMSD7_j7jwIUuY4muKxB8aqB7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX/qRGC4KQ6ZQH
 oDvgQDDBim8rkhfq9WluZS5EccPItE5XEQrMeOVJL0Q0DxkkRPvsAv7T3eMSfnnv8uSuDhJ02k4
 4TV8Hwq/RtMS3ANgQu4jpiU0wXiwOuE=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b000812 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=F3v9Kh8TxewD1bH5_NUA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200034

Once ath10k reaches ATH10K_STATE_WEDGED, the device can no
longer recover and remains unusable until the driver is
reloaded or the system is rebooted.

Userspace daemons may continue issuing scan and connect
requests, which the driver can only reject individually.

Mark the radio as hardware-blocked through rfkill when
entering the WEDGED state so userspace stops retrying
operations against a device that can no longer operate.

Both WEDGED transitions already route through
ath10k_core_enter_wedged(), so adding the call there is
enough to cover them consistently.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 99960f12dc66..676f9657b032 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2562,6 +2562,14 @@ static void ath10k_core_enter_wedged(struct ath10k *ar)
 
 	ieee80211_stop_queues(ar->hw);
 	ath10k_core_wake_all_waiters(ar);
+
+	/*
+	 * Signal the radio as hard-blocked so userspace (e.g.
+	 * wpa_supplicant, NetworkManager) stops looping scan and connect
+	 * requests at a device the driver has already given up on. The
+	 * state is cleared only when the driver is reloaded.
+	 */
+	wiphy_rfkill_set_hw_state(ar->hw->wiphy, true);
 }
 
 static void ath10k_core_recovery_check_work(struct work_struct *work)

-- 
2.34.1

