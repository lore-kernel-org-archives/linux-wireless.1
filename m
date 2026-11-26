Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795658867;
	b=wa7GQRIBy7dGg/gs835W0GpNGdqcPE7xH+wGvJ0l9EQ7p4hqVdrn4Nm//ArOEoO/+7Hx
	 uwCzuuFcPpUoPaguxk1Tfz8ga4AfDuOy4SVNJjTFKCm+vK8bpFkirAnUJpOF7WXWj945v
	 TViUIP4ajZTc/e4oEb9SF+22ejJqSUuGoLu4n2sShO9zxIBMdR51UKoa/9plLH0mDpcBV
	 f0w2SpMhBEdpcTzTH/8JDHOqfFxeBycOR6qXr7BNJclkKdJV+vKkZ5SWy3Ljx+30tEsST
	 kZq0RLgAgv9CH5NgBl9FOZX2By9caAdL55seHGUMCGX7b1J3CRzTtqBZ2+iH6nXjyJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795658867;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Nz+ktU89He0bF1hqohmkleNWzf3Mh6uTtANssCUZtI4=;
	b=UKT+rr6ZWO5SHezljSuotqDzL8EKlpp+lTV+dhs68yFleCHVVOLpgjWFjTTcy9JdFHlu
	 ooZ/06vEaOHHl6Vbpl4vuvqFIOWGtD1SgIyk+657KWNP90Wk3rlck5C/WDzrRAjJiM8RV
	 u3wZTYPs9p8C5cxYb92pMBR2qntQEjpwh4LWn/G6ppQRvhl0mbxQyLHfz81sX8WY+CUbw
	 ZPxb0+xmlYocm/wNnnu5BaS/7qSk3ODmvQ6gQgoOw7e/hyF1cb+Tfv6JfCeLJgzoXmqbS
	 eS5NCwK+L7S7tT1VWEnOfT5XfepEJxzqF5CuEW794SKilH9ODmbaV420BEu4laVRWuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F0wORpZ1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OccGHV+W;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B83606A326
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 02:07:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5B83606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F0wORpZ1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OccGHV+W
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJAt0W162720
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 02:07:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Nz+ktU89He0
	bF1hqohmkleNWzf3Mh6uTtANssCUZtI4=; b=F0wORpZ1u6nIPpGtOgHUU4KIF6k
	caFb5fzEQP6HdPKe7LQUsDnifWhN8AKvTM1DZpTWHCncJZgmCXFbkPbb6fYeZ0zm
	M8YK25+FKHiC8gizo3ToGlhFd+qF8d5dldaXc/pxrL+c+olLI32i4VJFXxzM6LK6
	zhegKMHQxApVN8UjHy+5FbPJIR7mKuwIRrMLPHFyCxrw47/DO3ZwX5OT3d0guWkW
	JMt+pyft4q3Q7LvN/i3jLzRhT+TtewBQQ861pH37VpiTwdqI5aIJAwptp6jsF1MQ
	gQ44i0rIavLlIaCh1XnSqgxm9l7M9l5sABLlRD7O7p+V1ZeW7/aBE7aG2ew==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62aej011-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 02:07:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b3f3e256e8so6244698a91.2
        for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 18:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795658866; x=1796263666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nz+ktU89He0bF1hqohmkleNWzf3Mh6uTtANssCUZtI4=;
        b=OccGHV+WBXwYGQLZSD1BEOW3Ooz/+fotYUDIHHrO9dCAcZOIYgaMvo/HH82pLsU3WM
         nsPETqtYSgVpQfvsPknKfBKCRy9WRkCVPPJH8MJ9/fqHmqbADKwGI7o1xu7HySGRg7OZ
         OX14n2i6uetQLq1i9T0oMe5mpPbDSCpX9lFPg5Vxf67IIG8CJ1l1emVOY8U5ULsSrr5n
         RBCuF0sF17FF3BfdpGf3lYgoq+B9JwoYXWTfBm5sROSG7AexcYnjbjeasJLf5DnxkJNg
         PCiXOempWrmnF+6oMRjeuueHboJiH7M2OuhlkfDMkBcLGND4574xFK/tBBw2+syjL5Ii
         Simw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795658866; x=1796263666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nz+ktU89He0bF1hqohmkleNWzf3Mh6uTtANssCUZtI4=;
        b=jiZ277IcA6Ibb2jvlzIic00fsgS6QeQzKB7iWX+6meQX//Qq1j5rs8OcS3sfW1xDN3
         J6eUD6IGAMMkdhsGqTP07vbNgQxE5In6qFHQAERCCsA+kb+RsE8MD0QiVhyyq/72jYj4
         llinuhUj/6r888ICoEsaFoPdk1iBAIAioXSXRhEjpSwgadqup7NnoLuepvEtVeR1pY9D
         nM4L1SCAy7A5IC4duKl0Nd976hutCpvk5HRZZiq2OOjOg7V8DcwddPR4c+zfFnV21O/S
         +sPX8Bm4Vw4p4rIrZH7kDrWVvvc0VmdWb/JHoPJ/36+aVNGNFy/SDsGLgOIsgDXgyjMN
         HEHA==
X-Forwarded-Encrypted: i=1; AL+hErGGS+KT9ndfx8vgANSzdBtHny1HmCcU1GqxtTaoMF3V+J6xtl26JEiV2eKFFSvT3GuR9lO5/IVDjInKuHX3cw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+250B2I04I4TeHcQYvA+K3+L3EQzuF0CA3ftwWLqFitpqjPRJS
	lDYgEUQzyH/CuUonmvQfNLVw891YxKygQVfQJwlCptKuK/Xvx5go1Mr5IZ6AKshZOn+fPxGtpWG
	dihvGXQq1eLYX8ZqGVu3Zl4EFL87gymwnSVG7CaBpqmvwQP9MOEwGfNxN107tCDJrIYTIfQ==
X-Gm-Gg: AZFdTZfV15KKK9CbrtFAM76m6GDMnTb8GiEcUzc8bE3u5I3cBI5Cfw3EUZlNwMz1DU2
	PCsp5DO1Mu3LkgaWpifk3BHnGYaahLEIVgZ7WRE/oVL4bWy5YEmC4nFK+LTWDowvkiSxzjgOPHF
	sDLnIm29IOTuLtQU1ipBBH6ES1MNXBlPgvCFN0kV6ObxwDjFW2FSuH2oydOAP1X/zuWu6WYuZSZ
	5ITzSHip3Wp3S8SyE/z2kW3Oa62+zxAqIoF59QOqWH5OVK0Oq32wfB5rmdei06xuKCrucD7H4Yf
	1ornUf7KQAj4UngGnlPd6qC863icejdY6b4phDtGqbm08p0UUW0oO8bDnPwHa5cIGQdS+vBXJCR
	BogXmOgsFou3l9Rs1YU3ijYMeyFmY+BMF/W9zm/DJRszTEeun8biHClRfLoN1n1D8o1+AiGhjJC
	9gTdEwkGsgC3bHKuYw9iMlq1dcc34MYNwL/GSJ
X-Received: by 2002:a17:90b:2e47:b0:3b4:eb3:a34e with SMTP id 98e67ed59e1d1-3b41c8fe15emr17358140a91.21.1795658865330;
        Wed, 25 Nov 2026 18:07:45 -0800 (PST)
X-Received: by 2002:a17:90b:2e47:b0:3b4:eb3:a34e with SMTP id 98e67ed59e1d1-3b41c8fe15emr17358115a91.21.1795658864718;
        Wed, 25 Nov 2026 18:07:44 -0800 (PST)
Received: from hangtian-z2-2004.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a34asm29626356a91.3.2026.11.25.18.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:07:44 -0800 (PST)
From: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
To: jjohnson@kernel.org, baochen.qiang@oss.qualcomm.com,
        rameshkumar.sundaram@oss.qualcomm.com
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 5/6] wifi: ath12k: add debugfs control for MLO simultaneous links
Date: Thu, 26 Nov 2026 10:07:26 +0800
Message-Id: <20261126020727.3273337-6-hangtian.zhu@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261126020727.3273337-1-hangtian.zhu@oss.qualcomm.com>
References: <20261126020727.3273337-1-hangtian.zhu@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAwNyBTYWx0ZWRfX6c3wC18ZFui7
 05VB5fzsgGmtHkyQgT4IbuXVxfoFU5OITvzkL6Ej1dU87TMqFC1Ty2kblJFj1yR15Ahg8ZGhbaF
 iAnL6aSi+8pGUZwJ8Ku+VZ2BQ1ABRtjGZLN3tN+B+RtFp3F9o2sqLjUTq5emu5MLF2r2v8h8eAx
 lE1p0u+z/l8o6My2SDITloflYtzcmkbmuSURPKuS3FPQgPYGf08xN9VPbtHfbCYUGpQNKiBvXT+
 2/2pwVHxy5UwmtGDBiljN1jrHRiUjMHfueYaaVR3doPMt3dqIahBi63IiWQ708PrmBRdWHfAmfb
 Qm3ipVXkNVChdM+3o6nLyUjpTE02SsLlekXjw6/ytQCtGaVC5Es4T+nULu52ZbfphMuA3x26DbE
 deNA51oCvBcJPImUjfsMGP+29kt06BzIN9hY7pPucVI83sIeptvYagx9fs0JiPh4S0wPmah6p+v
 8pWnEkHhNAuRin4CtLA==
X-Proofpoint-GUID: JHMb9KBMPGZfaLe2f6jv8asSnNTsbj4F
X-Proofpoint-ORIG-GUID: JHMb9KBMPGZfaLe2f6jv8asSnNTsbj4F
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAwNyBTYWx0ZWRfXze+JJFq6ANgk
 kJIZxMwbt8jdtfBqzNIH3AggPxOCFVMZm5kF65MhrSa74xrEAD8ZZUMhpnAT4elJKDR9uo/hvV0
 HVnDoYScmNoWVa8EQTyYEWD7BZP8DPk=
X-Authority-Analysis: v=2.4 cv=PqoG/AM3 c=1 sm=1 tr=0 ts=6b079472 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=oayyblq_nbOQyOWrDy0A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260007

Add mlo_max_simultaneous_links under the per-radio ath12k debugfs
directory for MLO-capable hardware groups. The value uses IEEE 802.11be
N-1 encoding:
0 advertises one simultaneous link, 1 advertises two, and so on.

Use this control before station association or AP startup to validate
host-side MLD capability advertisement and exercise link-count-dependent
MLO behavior without firmware changes.

Bound writes to the first local radio's normalized firmware capability.
Infrastructure targets derive this field from the hardware-group radio
count; client targets using the firmware-count policy expose a single pdev.

Update only the station and AP iftype capability entries, leaving the
generic entry unchanged. Read the current value directly from the station
entry.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/debugfs.c | 90 +++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
index 12791e267d1a..657bdd4c7744 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs.c
@@ -1587,6 +1587,89 @@ void ath12k_debugfs_fw_stats_register(struct ath12k *ar)
 	ath12k_fw_stats_init(ar);
 }
 
+static void ath12k_debugfs_set_mlo_max_simultaneous_links(struct ath12k_hw *ah,
+							  u8 max_links)
+{
+	int i;
+
+	lockdep_assert_wiphy(ah->hw->wiphy);
+
+	for (i = 0; i < ARRAY_SIZE(ah->iftypes_ext_capa); i++) {
+		enum nl80211_iftype iftype = ah->iftypes_ext_capa[i].iftype;
+
+		if (iftype != NL80211_IFTYPE_STATION && iftype != NL80211_IFTYPE_AP)
+			continue;
+
+		ah->iftypes_ext_capa[i].mld_capa_and_ops =
+			u16_replace_bits(ah->iftypes_ext_capa[i].mld_capa_and_ops,
+					 max_links,
+					 IEEE80211_MLD_CAP_OP_MAX_SIMUL_LINKS);
+	}
+}
+
+static ssize_t ath12k_write_mlo_max_simultaneous_links(struct file *file,
+						       const char __user *ubuf,
+						       size_t count,
+						       loff_t *ppos)
+{
+	struct ath12k_hw *ah = file->private_data;
+	struct ath12k *ar;
+	u8 fw_max_links;
+	int ret;
+	u8 val;
+
+	ret = kstrtou8_from_user(ubuf, count, 0, &val);
+	if (ret)
+		return ret;
+
+	/*
+	 * debugfs value uses IEEE 802.11be encoded form (N-1), matching
+	 * MLD Capabilities and Operations per IEEE Std 802.11be-2024
+	 * Table 9-417n:
+	 * 0 means single-link, 1 means dual-link, etc.
+	 */
+	guard(wiphy)(ah->hw->wiphy);
+	ar = ath12k_ah_to_ar(ah, 0);
+	fw_max_links = u16_get_bits(ar->pdev->cap.mld_cap,
+				    IEEE80211_MLD_CAP_OP_MAX_SIMUL_LINKS);
+	if (val > fw_max_links)
+		return -EINVAL;
+
+	ath12k_debugfs_set_mlo_max_simultaneous_links(ah, val);
+
+	return count;
+}
+
+static ssize_t ath12k_read_mlo_max_simultaneous_links(struct file *file,
+						      char __user *ubuf,
+						      size_t count,
+						      loff_t *ppos)
+{
+	const struct wiphy_iftype_ext_capab *iftype_ext_capa;
+	struct ath12k_hw *ah = file->private_data;
+	u8 max_links;
+	char buf[8];
+	int len;
+
+	scoped_guard(wiphy, ah->hw->wiphy) {
+		iftype_ext_capa = cfg80211_get_iftype_ext_capa(ah->hw->wiphy,
+							       NL80211_IFTYPE_STATION);
+		max_links = u16_get_bits(iftype_ext_capa->mld_capa_and_ops,
+					 IEEE80211_MLD_CAP_OP_MAX_SIMUL_LINKS);
+	}
+	len = scnprintf(buf, sizeof(buf), "%u\n", max_links);
+
+	return simple_read_from_buffer(ubuf, count, ppos, buf, len);
+}
+
+static const struct file_operations fops_mlo_max_simultaneous_links = {
+	.read = ath12k_read_mlo_max_simultaneous_links,
+	.write = ath12k_write_mlo_max_simultaneous_links,
+	.open = simple_open,
+	.owner = THIS_MODULE,
+	.llseek = default_llseek,
+};
+
 void ath12k_debugfs_register(struct ath12k *ar)
 {
 	struct ath12k_base *ab = ar->ab;
@@ -1647,6 +1730,13 @@ void ath12k_debugfs_register(struct ath12k *ar)
 	debugfs_create_file("ext_rx_stats", 0644,
 			    ar->debug.debugfs_pdev, ar,
 			    &fops_extd_rx_stats);
+
+	if (!ab->ag->mlo_capable || IS_ERR_OR_NULL(ar->debug.debugfs_pdev))
+		return;
+
+	debugfs_create_file("mlo_max_simultaneous_links", 0644,
+			    ar->debug.debugfs_pdev, ah,
+			    &fops_mlo_max_simultaneous_links);
 }
 
 void ath12k_debugfs_unregister(struct ath12k *ar)
-- 
2.25.1

