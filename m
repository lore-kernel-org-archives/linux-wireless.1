Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794970574;
	b=q7VjBLyE9Qh4Lkk8H6IGZpgTES5ps+WJ//WTLpFId+eateAbLw8mACUtERG63UKg4HFq
	 Qu8+xmCRkaE8hpxJfcYbNYkHs4UIAl1Bii+N46KlA58jT8Uv/VwNt69kY4mCX8fZiDzbm
	 rNbXns8oWM2YWUr9Xhl0EgC7sZWLUsUZTL3SaULU+ofevNBTRzeOQ9DtaFffhkgeqoBQ8
	 aV28PswX7SUZPomCRnWMrAoPzlNXS66izTlLS51KSFlBsSKzS+h4w1+EyzgNX43ITG+h2
	 AKnfdz0Tk1Ems38ZXnulS3X7WOCHw1oYfhYFsSNQb9bDEkxDFNhC5KxPAFA6Cqt+SvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794970574;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=85SmBv0V8+7ADPhne8xBAQBkF4pjtqE4x299Tb+RoYE=;
	b=uMXFA73OIQUnc9KbqYjRbZHCxUXEh+G7IktprFqzZSf2M7ofaZ7V7k9VrAw8P2jZpy9a
	 bjK7X9yBqmmFti2fWMvF7KY6X4teoiGzUr4yST5wdky9vwEQB9qxSbd9Y5FChN+OlpCjM
	 9FNpoVO5F76ev+7+JRup1St1R1q2gfw2Jlqx7WhVpu4Yto1GqYgsw0OkYwPFeXIIrkU3i
	 tDcpphW5mTBZaU9Jdjg2rZAZ2iaiXhDmmTyWzeYEfCpuueiRzt7JKfGAJRFFbwqXuTMvH
	 YGHIQ7gAt73TQt9Vd0p3Ajc8ud+j7kPmGeCemjU+li2d1/yksH374RgQ63dMCK822ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LtPt5SP8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ADrRmTAE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5638A606A890
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 02:56:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5638A606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LtPt5SP8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ADrRmTAE
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V6SB2603443
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 02:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=85SmBv0V8+7
	ADPhne8xBAQBkF4pjtqE4x299Tb+RoYE=; b=LtPt5SP88+Km7da/ttHAxJQoZcL
	naplkyj0WrQ+JEPvPgfLZu5336u2oFIe3CGEU4b80/3lzsRMbIRlR7vzMQWFb9Df
	8hZj1k5d10udrzbSb8YChYPZELZVl/XymdNlNl0zGnYrfsWnEgbnaGOt0dJfdfzC
	/OKFvGqvTWtbzCa99OTqkJoy5Ij0lZ1kGUmpiwlm/y+O0cKA0yax0NizAI6zE0nz
	Fhy/PkDFtfF7vBugQxaqxIE7/fdNCIbY+tys6Gx3uLpzdN+dsraBnrVgwFhpw1RH
	SV/fK8fJ3pdLrB/XhwsX0mjXH3zpUN/vIVSPjalcywja9JrSLAJHD6zPnsQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv70ucq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 02:56:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2efda2c6605so3065245ad.2
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 18:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794970573; x=1795575373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=85SmBv0V8+7ADPhne8xBAQBkF4pjtqE4x299Tb+RoYE=;
        b=ADrRmTAEOLgr8TxC66WMDLEOjsx1AE2NcBwNmSups19u4Wqqr5Lwc8gCjyjselA359
         FBAF4TwW7xIFy8Kx3vQPn6LbfThtoaUQZ0bUlGGKzpXO+bIhRRug/MchOhxZf57o+XzK
         tHANtT6n6IjRMKqMlx5KzPccc+pdQk3b34Zr3vKsJYrovJHPKt7ppoViFWWmLXEVAfu3
         CBwSijFb/1xQAX9VHgkOyiciXeLilYT0e5gFyoN+hYBHQLZc4F/9YWCYMp5pxhodBSce
         cJ/FhOVmrv3+31Cdb6X7TepD/LbnGxGO28f2jEePnutG3swB6hsQUNvDvB5twZWOiA1/
         gfzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794970573; x=1795575373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=85SmBv0V8+7ADPhne8xBAQBkF4pjtqE4x299Tb+RoYE=;
        b=tS4L0I08aCfYkSGO4zcfpRyRM+FantKjZ7N3v3Qd/0kvfbdqYEcvwO2mQgoH0E5I+Q
         p9XiMP+m1WugfhjtaDvphHJjPTKjaTjBNf5muTV4kueCqYNdpIDQMQbdMpquTATMACJv
         H4yQ2aiWRpMQPcYli/Q3BEpjO0s2tLj6ccdzZOnBlvMvD5eCTML88Cg+Z8Y12QSpxihz
         +icyOnL82ZanZGKo920hmLU7KSemBt1hUKLNReypHUSaXWETV6AwCUEGhjT3+WNC/ugv
         0hGPLBEEL3yaOPVwGYqaif5mXaEvVc6jIvPK5DCXGyiHfRk95VlXamMHfTFP3WVht1pT
         7Mxg==
X-Forwarded-Encrypted: i=1; AL+hErFlLezmh7bI1r9i/DuuLm+2NbD/hBOYMV8WUQElWArHzJUcriWtdS/WUoSPmmTMRZjk6tsmKrODBGzy/qHh8w==@vger.kernel.org
X-Gm-Message-State: APuU4Z+QeAVi0r9M9tNrEzgQ2G6nwI4CMFwuWR/ps/yiFZYax3GVVzu+
	1q8xWHCtpw/NDHYxv7oSqx9LXsZR34M02bvffliMUox6Ci9uakfiBf+4zf6k0ufcX/HrSKR7ta5
	iVhk+S/IALu7Hh24MJQqyZyIOtwD2eNsLvTPtVrXC4QHcCDY61vpkprMYxvllRb3VrpoYPQ==
X-Gm-Gg: AZFdTZcooKCc/9daV9NufKFpuIvFTBbKWYVEE+AQQFpFQ8Iw+FfkoKkR5k0c5ReodMP
	vlfGxeJ+USNmAW2/XkjQ5ogVSySd0JVtXqjTMlrhptR37a3AjqS1H89N5Mq1U4ZxJh4cZE2iIdu
	EdEVhmoX2vmsGHvQgZeCtBbfq/mqNWTL52X5K5BQ80PFU8i+PE9Myn7kh0TJn4GINyjHtAxIopI
	KPp2ygou5cBOR2MfJzXCIjjdJ5ytWn4pdi/KTDT0RLmrBGSILZxnRUrzDlNFp/4lEJ69j2cSj92
	n+ayMB7bKhygKm6Tq6xv7h00jO0+vtKIYaReqKsZ46QawSEbZqYyF4vsRSQetNrrnDQYmuRb7M9
	+Tw5uMsH1Iq+LvIqB8NvNPZ106o9/gamz8ApYZ0ovi2IITnI4HxIflrMN75En2mXbRX40/zXjMc
	Bwoo+1sllc0yWwhU59oIgq+Braf2+n2cQ=
X-Received: by 2002:a17:902:f70b:b0:2e9:6788:9381 with SMTP id d9443c01a7336-2eff7100e1bmr12651865ad.7.1794970572845;
        Tue, 17 Nov 2026 18:56:12 -0800 (PST)
X-Received: by 2002:a17:902:f70b:b0:2e9:6788:9381 with SMTP id d9443c01a7336-2eff7100e1bmr12651685ad.7.1794970572382;
        Tue, 17 Nov 2026 18:56:12 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff622710fsm4842745ad.49.2026.11.17.18.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 18:56:12 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next 6/7] wifi: ath12k: use WMI_MLO_VDEV_BITMAP_SZ for vdev bitmap bounds check
Date: Wed, 18 Nov 2026 10:55:19 +0800
Message-Id: <20261118025520.39269-7-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
References: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
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
X-Proofpoint-GUID: B7jq3dqrnc0LV995mGApBqINGiVH3JI2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxMSBTYWx0ZWRfX24fsF4UbbPcL
 aLkIoWnzQsHQ4F1LN566IlpKPLljLbsSoY72ERNHsDq4Dmm4Ye7O8qX1jSPNkF+jduPgd+wCajS
 5bRhuvn2mgpyJJGwCY5EvOdOyrMRXYV1qntkd7RSX64M4bk3ZVdcDlk6CXPS3vjjostIydfpplR
 mOOaleBSfPNO9l09OKJ2UhuPRmQQgI7UK0q9nJYAYqKm8DtKH+ok7+4zwkTAg4Bzz/RRWFtXR+z
 DoiWVN/YHxuFqPXqqDq2g3VgP7Mv/Df80wyB0PB13U2dpyQfE8Aq6HOozoGTh86dv49OacyaGkn
 Ju8NhsdxSgcdMJ46XKuRrepS96lZi7JMABz5l44ZHfXGsRSNh49eUq7cClLtbO5hlffizPlYj1f
 rkiSyn659SV8f61S4SKJrNlJnZl/wx7OsV3HEkTALmH2fj3OKnz6fecjudb62vJKHpbGM7lz88I
 tfTjQEXQgUOT0u7VjVA==
X-Proofpoint-ORIG-GUID: B7jq3dqrnc0LV995mGApBqINGiVH3JI2
X-Authority-Analysis: v=2.4 cv=H8xOUOYi c=1 sm=1 tr=0 ts=6afd13cd cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=LZTIgfvDWzmdvsE2OGQA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxMSBTYWx0ZWRfX0edVOEhO8gXY
 OhbdHMnvu/VAkwJjNugjXQQHZKknkLitS6AdS0MUhsTd6FCE4bQl1GRcOQgQfW/NNHOOupJbitt
 NP4MDXe7Pr8Y1IL+HK/v4pKqqyHDe/4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180011

ath12k_mac_mlo_sta_set_link_active() fills the vdev_bitmap and
inactive_vdev_bitmap arrays of struct wmi_mlo_link_set_active_arg, and
both arrays are sized by WMI_MLO_VDEV_BITMAP_SZ. The bounds checks on
entry_idx, however, compared against WMI_MLO_LINK_NUM_SZ, which is the
size of link_num[].

Both constants are 2 today, so nothing changes at runtime. The check
still has to match the array it guards: if the constants ever diverge,
the wrong bound either rejects valid vdev IDs or allows writes past the
end of the bitmap arrays.

Use WMI_MLO_VDEV_BITMAP_SZ in both the active and the inactive vdev
checks.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index f57d4ef413e8..dfb0f6e678ac 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7605,7 +7605,7 @@ static int ath12k_mac_mlo_sta_set_link_active(struct ath12k_base *ab,
 		vdev_id = mlo_vdev_id_lst[vdev_idx];
 		entry_idx = vdev_id / 32;
 		entry_offset = vdev_id % 32;
-		if (entry_idx >= WMI_MLO_LINK_NUM_SZ) {
+		if (entry_idx >= WMI_MLO_VDEV_BITMAP_SZ) {
 			ath12k_warn(ab, "Invalid entry_idx %d num_mlo_vdev %d vdev %d",
 				    entry_idx, num_mlo_vdev, vdev_id);
 			return -EINVAL;
@@ -7625,7 +7625,7 @@ static int ath12k_mac_mlo_sta_set_link_active(struct ath12k_base *ab,
 			vdev_id = mlo_inactive_vdev_lst[vdev_idx];
 			entry_idx = vdev_id / 32;
 			entry_offset = vdev_id % 32;
-			if (entry_idx >= WMI_MLO_LINK_NUM_SZ) {
+			if (entry_idx >= WMI_MLO_VDEV_BITMAP_SZ) {
 				ath12k_warn(ab, "Invalid entry_idx %d num_mlo_vdev %d vdev %d",
 					    entry_idx, num_mlo_inactive_vdev, vdev_id);
 				return -EINVAL;
-- 
2.34.1

