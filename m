Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482794;
	b=TNYs6459CX4ispbhE6ojN+04EiIuQNgw7UneyiJYH4fHLuFO1fEhbmU3SLuAJ7lbhGPA
	 hVZop5tflbnXhobzSqwtH9uD1ECO6mP4tJFKcK1uz8t7sDITgipAdT/gslaxyFhdwnZhX
	 uBAVtB+peroOrsPTBjqo1aYuHXYK5tP6Ea0U4lvQeQKNlwH2A8M7UvzFM4LxdagBsuoZQ
	 +waaqKTc87lTwMWFvaCtSsbmd6e/vWfZ5Mp41eGH7sTPC5Bv3lxtjE2g7ji63MS+h8bG9
	 XbT49rjw4FN5a2NrDj0nbzIkav1foLo3shunFgmgy+mfLsavihFJ+0pQUfUzfFOT2uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482794;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5fAbncqJtX82IhsFm2H8S1cIjewflvsuECSfWHLAZ84=;
	b=1KI4v+Gg92b9MeedbcMlmBYxf19lN+bTEyO9fytXWSz6szoRipEPFyOtbapxKsmDKXoF
	 2pz9i8JkQrwAUoQ+KLZFSQI6Ci3qKBomlrWLUl8BFNFHZ3JsQ1Ju+Wd+6wXIswjwZmVsg
	 37Ge0JvwSUSxxVadcK7edHuKapmR4utadEeWV3+Cuvbw3UlIyYX1NYIQfTuI+X7IqIhXt
	 NipMi5Ia28ydTvaRYLpgF+Se91IB574J4NDsUTvWpSD1iZJg2ChtLqMHXZNgrjXRlObTO
	 a6zEcCwz4iQ2BnWSzILn+zCTOgcvUahfO62tr0xFetLco4sFX8L7jpTUtlotqP3+MiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LmF0wkuo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="J7lyl/4R";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DA2606C158
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 11:26:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37DA2606C158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LmF0wkuo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J7lyl/4R
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACAfIPO1953679
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 11:26:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5fAbncqJtX82IhsFm2H8S1cIjewflvsuECSfWHLAZ84=; b=LmF0wkuoImZ6K5Mn
	CoMcB/Uwe6ghELLqCS1Qfg+3j7x/sXZC/jpKp8GcYAj3xW33cIXDlktbsaHYUHv9
	Am/yApWRxRfXp77II0V7SczhyJ7LS8o1TUWwvqxO5r1AEY/Z3lPJdxz4nLMmLOpK
	GN9+fX8sLhv86GDjJBOBrVKOGDfMG/8dmA7HI/ozopsetFxZvBXNrLl3+36aPnl5
	qnmtcoRoY2fJc7MZs2Y0Wr/jJ/ou5+KyB7En24kDjBYU5pXZFyeuZMte+aSNraxq
	lU2Pgcms/HpU7DnqumsvryZW8ucFEaxG9vyn3X3L/0vrvCaX1bwGKN0E/6SkKL+Q
	ByFRHQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbx304qs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 11:26:33 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso7692199eec.1
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 03:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794482793; x=1795087593; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5fAbncqJtX82IhsFm2H8S1cIjewflvsuECSfWHLAZ84=;
        b=J7lyl/4RjbUMhTQBuEm0oCSv3otMAJfu+sF2d6OKkQGZXnfS9WijZwBjd0eReblJpF
         7FO/l3C+/TLS4JPt1PSaVbE5uERJXvnXk64gE2tgMOsyGmjizCSU32Fi6BKBWpCTHfmc
         xK6hcMnhwphxIJ0pvVQpRb9Y/iYGo23Vlg7FQ1MSScmA+MexIGQ96k9wKiLMtDBH67Xw
         XLW0uW3Uv57xyKuau4G3G1hTE5mj+GgRa11mmM7ifFQZqXQAU51uEHMnWKkclnCnBJzi
         fS8G5UNeZQsWZZAeSQHLBsdP5OkRMBCn/PibdPu277n6ohvSbJ7l7MG/ByjmKqyvmsuk
         2Ssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794482793; x=1795087593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5fAbncqJtX82IhsFm2H8S1cIjewflvsuECSfWHLAZ84=;
        b=2mtVLH9c78M6OEa0Y4Ag7QBb2CfJiwPO9XVYk/oqAYxlkapIcAdFlJaCgzbkT3dVxT
         5aYCg096rKkrzTkBFfhjOTjVVrv6ZIH0D+fQCRJHKXdfZFLvCuEmo1Y2kHlcSsAlOABt
         Jnsns0BctJK2u08NhQWF/vfkNfx9YudMdeWF+UdgpqYvF+ZSfYHTXR9hiKvK4rroideM
         pZmgmuWGjQ5JjTLeS4xeZEA7LS/fC5US7AAzJKYf5yDIE4ikqmA1nTYxuVVJGpp7eM+Q
         YHRZZoEyIzt46W5+C7fwRG4oiFQygIacvTWKFNhhHA6ckj70IViKyH+nLUG0BKFRJ74z
         pfow==
X-Forwarded-Encrypted: i=1; AL+hErH0LK9581p05gfkCWOyLs9hspionNWcXLKWDhANCZrW0BTcUHYSZsaKP+kusHz2vfjrLn2b8oH4WEIlumCWOg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/eoDsEKZ98n9t7dWrXkXatyKRzyp7A9UMMDnVu3K6JNgsySXdf
	mHA3ZssB1MXh8LTk3A+7BX4qmRwaPJHqBi0ud8lM5iMNoqd8T712C9NcNBsydAwoJ6aqCMysX8m
	XwMrJ+XNe0BG5eou1a55gfYCkE+t0Ix1YvYp5L4kLpTH6pR1taBIvZFo1CIBD2S55wOf0Kg==
X-Gm-Gg: AYBFou2DVmqAoKFfbWwgOR+cZZ28lOm0Unw/OvVTbdYRpBPExBb1nj+cgBzzlZIBl+g
	z0G7C4LotHKPFJmk984zC1/G5KRpAMsRKZHopdTEKFFzNjD6HErcdjbclg+Xpa62rWvuJN6PH3Z
	in/zQRMVl/5n/KELy24T5sztrfthdnqzXAOkaq8cUo0NyZ7Nm5PNNQX5dTtvLrHDsQEutme7m4k
	qOQEbuuFWgPZp+GuF3G0CpSZk91fiUjiQV7+54AvYqGT61BZOl6xYO5xrwFy39zrnjLYMhvYIN5
	pXXRJreCBm3YpWQkDWaKiinD/1EL4e4cFcOr3P5uq/saY3tX0YRTaRVZcBZzZT95SqTLziN5LaA
	XONIvsH0kJna1ndvjYIICIDRosisUNGOLNRU32Z9PpwunJTkSWC+1bOtAHyxRjjcPnonmugrtgv
	kI3B14qVAw1BORgT3LZSU7+H5O
X-Received: by 2002:a05:7301:77c6:b0:36f:d53:cf2f with SMTP id 5a478bee46e88-37682f94242mr5567237eec.1.1794482792668;
        Thu, 12 Nov 2026 03:26:32 -0800 (PST)
X-Received: by 2002:a05:7301:77c6:b0:36f:d53:cf2f with SMTP id 5a478bee46e88-37682f94242mr5567223eec.1.1794482792057;
        Thu, 12 Nov 2026 03:26:32 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm30402359eec.19.2026.11.12.03.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:26:31 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 03:26:02 -0800
Subject: [PATCH ath-next v3 03/10] wifi: ath10k: also wake remaining
 blocked waiters
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
Message-Id: <20261112-10k-sdio-crash-v3-3-24f03f300bb2@oss.qualcomm.com>
References: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
In-Reply-To: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794482788; l=3115;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=lDNxJn1DHSRkmNxna6PrmHJkPmD6XPQRW8oNa+Sh5QA=;
 b=ssMZwuMKrv028w7u1BxJ+eP4EBOzZMCmHoHHaWAawSaOZ2CmFi4amXXN6/0lJl+bJLyGZjp+2
 ucYt+nLpm7iB8INxGzmJQ+KCdjP5J0idjgjZYjdq7dSUcg0hvhReiWn
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Authority-Analysis: v=2.4 cv=S+5MU4sP c=1 sm=1 tr=0 ts=6af5a269 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=IOUMnZVgalWeg46eWFIA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfX0D8aMPFw74Ug
 vFjijubmh6szMbc//YpX02kGw2WMZF0HsygQgrQ0I/0NinNZ6mOl1OTGan2SFv0u3UOExE+CEQO
 YDbd9xwYS84iViSt1m2Cs+8Yb2NPrJr9k1kMJyYTFUshBQxoFLUu7vCr1RAaIUJHPvh/vgx59SM
 XegjT1SnVeJXz4s8Ru1RQotaOcGPNjchZIqfy7KD3EOs+A0AMUM4oqaDe3KCzS8+Amo/r+fjK1K
 dUjDGH8ntpf6xzPmOYGoRAsRav0YK6SXy+UNxvlTNxWYFpeU2YS1I790JR5kAcroVp0m+zRM7o/
 PxUlsmSvAExYNpqisjDWQ16TuYceOl3r2ujBUz92Jv5EfuXlOvL+QnqL0P0HVqAXjOz8cqg4Zit
 dGfPIdUILBU3oE+T3FckJ57kQOy7cK9J3Iwk9cXsZLAPakIEBIvZ14wrxKCvMgBaQgUJjG6e2Rs
 /Z2gDEn6D+Dw+SdMzeA==
X-Proofpoint-ORIG-GUID: qPvHsw3x5L1mo0LNTB1ZSzGnrUmsWSCS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfXzt7Ofdak4zYG
 P1IkzjjJkKxfsGVVklyjWO/ICrumM1QvYR42raqJDqIxgJ+1Y6zbZsvyNe422DJEKbyW1I7P+Gy
 C7pC58k5pl/bzphLRckqPCxgECIxqJ4=
X-Proofpoint-GUID: qPvHsw3x5L1mo0LNTB1ZSzGnrUmsWSCS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120045

ath10k_core_wake_all_waiters() still misses several completions,
leaving their callers blocked after the driver has given up on the
device.

In particular, callers waiting on peer_delete_done, target_suspend,
wow.wakeup_completed, peer_stats_info_complete or wmi.radar_confirm
continue sleeping until their individual timeouts expire even though
no further progress is possible. The WoW and suspend waits are on the
suspend and resume paths, where these delays consume watchdog budget.

Add the missing completions to ath10k_core_wake_all_waiters() so the
callers are released immediately.

peer_delete_done is not otherwise reinitialized before every wait.
A completion left signaled by recovery would therefore make a later
peer-delete wait return immediately. Reinitialize it before sending
each peer-delete command.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 5 +++++
 drivers/net/wireless/ath/ath10k/mac.c  | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index e32bacf5b771..d86c4ead06e6 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2500,7 +2500,12 @@ static void ath10k_core_wake_all_waiters(struct ath10k *ar)
 	complete(&ar->install_key_done);
 	complete(&ar->vdev_setup_done);
 	complete(&ar->vdev_delete_done);
+	complete(&ar->peer_delete_done);
+	complete(&ar->target_suspend);
+	complete(&ar->wow.wakeup_completed);
+	complete(&ar->peer_stats_info_complete);
 	complete(&ar->thermal.wmi_sync);
+	complete(&ar->wmi.radar_confirm);
 	complete(&ar->bss_survey_done);
 	wake_up(&ar->htt.empty_tx_wq);
 	wake_up(&ar->wmi.tx_credits_wq);
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 3c45e5483b60..6179a029914d 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -843,6 +843,7 @@ static int ath10k_peer_delete(struct ath10k *ar, u32 vdev_id, const u8 *addr)
 
 	lockdep_assert_held(&ar->conf_mutex);
 
+	reinit_completion(&ar->peer_delete_done);
 	ret = ath10k_wmi_peer_delete(ar, vdev_id, addr);
 	if (ret)
 		return ret;
@@ -5898,6 +5899,7 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 err_peer_delete:
 	if (arvif->vdev_type == WMI_VDEV_TYPE_AP ||
 	    arvif->vdev_type == WMI_VDEV_TYPE_IBSS) {
+		reinit_completion(&ar->peer_delete_done);
 		ath10k_wmi_peer_delete(ar, arvif->vdev_id, vif->addr);
 		ath10k_wait_for_peer_delete_done(ar, arvif->vdev_id,
 						 vif->addr);
@@ -5960,6 +5962,7 @@ static void ath10k_remove_interface(struct ieee80211_hw *hw,
 
 	if (arvif->vdev_type == WMI_VDEV_TYPE_AP ||
 	    arvif->vdev_type == WMI_VDEV_TYPE_IBSS) {
+		reinit_completion(&ar->peer_delete_done);
 		ret = ath10k_wmi_peer_delete(arvif->ar, arvif->vdev_id,
 					     vif->addr);
 		if (ret)

-- 
2.34.1

