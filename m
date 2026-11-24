Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795504419;
	b=5HhShz1cffiC2i9k3QCkwG69bgGkDFQ1aG1a65KGwhErU4Ezy8BeEkbVp5bBcze0UiTf
	 uSGWf1e83PJ/pDeL0lutOR0Vp2SpI1LrP7q5NUBZFIrKoWG+Haj0WNlGqo+IDqguvrVMj
	 bDAUbPSUVNT2+hm1P75w7FTxKxy6xe9rBZHFVWQylXVOaFqf0fLjSt89oq0xOCr9qQM5c
	 UVGuJq9NoI7YiacpP6ONMMfrZGikqUIsQmjYruW4LP8kUJOaFq64jskK6exnx4fkpMxZS
	 dEsz0dJuuVKaWywiwnEUfSNKRFNvx2Q9E2rzNETi6PqjOZFgAnE7OXyxr9UtpJ8fslg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795504419;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Mfwg+661utS6lCBz3WhprT2uGwiJtNmkyVc94xoy62U=;
	b=Q5w5gODLRdv3kSerFpiUctoYBQfUXLFL8+hMgvNaVYGFpeuvvgYv9fhvYqrpczE97JWQ
	 gOOVNc7O0Nnz0oI1ky6F2MIVRejEEsjclK87zVl2dj2K9egX7kV2y3iJ1LHRxTbC+DK74
	 reHRiRY0ctz3IbkuXHjqNSb8r9w7kEmoe7kroh2x3+bx6WPznpqY/U/AYTWBfIJ+dkX6n
	 GEMedN+sebm6zE9+8HEd6Xv0sZlR05cJfI7xqsnMA/39ggUmsysATu1nSHPoLEdVRoxzL
	 uFVRFWgcd6OhLEjTG5e0wpyTKH4w9SNMkNeN4lAH6pN2xZF++i6lr3kZmwRYQjXEZdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gySOpWsT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gvpsyp9H;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA34F606A31E
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 07:13:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA34F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gySOpWsT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gvpsyp9H
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2kRJK2209333
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 07:13:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Mfwg+661utS6lCBz3WhprT
	2uGwiJtNmkyVc94xoy62U=; b=gySOpWsTJNFwJj8+I/5+OSMmLxAwdKFxI+1bS0
	ob/jLO22LNdtKNDdC+IQt9CfysskBUoMnmiwmkf/JbWI0w7qm4K3SmuEkdkgfBUR
	jK8Ve3rrT5VC4cTouggrr+xL4Kz6r275LxKLtm+Hl9QJEeIfrgKF7GaOSuJDVqDI
	lj8Kb0DtZU5bweSdTYPU1hj5oH1+g+JuTBPmOBb9/5QlJYU1zItt275A60WLhpxc
	Am7nKG6vNeD5yJ7i9V2Ku/Mz30sOYlhpCPIzXpk1Grt1WSH19QHD/U2X1RkthhI8
	As8jmfxbs7gIbLKvmmYu2LzePYqu2KW8fgcvwn1GbugdPjzg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yy11c7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 07:13:37 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b41333cb47so3521220a91.0
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 23:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795504417; x=1796109217; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Mfwg+661utS6lCBz3WhprT2uGwiJtNmkyVc94xoy62U=;
        b=Gvpsyp9HU/MQBJfjq8z/pmEV3eL/3wwtkYHC5UottV0hNSLceqawB2lfZiQ9J6Fso8
         /MS3SK4J9yWU+/jEq98N2yWmeiNv8q49/Pdef7oZYXt2Y163bWrvmmz7KOXmAugIkvXC
         XMc+Ypg9z0LIMlBpiB3UueYqNCgX+MK7Hzyeaaad0z1rq2wIaJ5eia2F49CGpKBtLl4L
         1RN/mDCuAExYhcmV6qmapUgfGsNYcbmYe+4Ft05knaK8KgwP/LTIIGze/cJvoajUbDKB
         GanrofdkgId5m1hikfFri4J1gvkHnQYhl+hhhdqpURPtlfPzziLmWWwQuYxtMPcN92fd
         t3JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795504417; x=1796109217;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Mfwg+661utS6lCBz3WhprT2uGwiJtNmkyVc94xoy62U=;
        b=ALfYIzVGoiAto1aMySf0y60jyh23diF8tkHBtKAR5i7CyFa5zIMFwSmONnBhlTu2qm
         /Vc/oVF1cdiJEHZomMbvnD4D8ash1fpVKFyN39zo+nTkyPxsycFCk4FSTAlBO563M3S4
         qgMDedgIDc+1I6XsnW8jS9RykwD0JFhgS0l+SU975E7c46fCZHrwaOq6yVaYtqlg0110
         ndhDvM22ztRV3pgy8WlyQq/zASUiftUEqVTlFm5201h93wChwm3ht9UlvPk4Scj/doXe
         lChMxgquvDtUP8wV0JMbURbyDyJCkQHa3qmfbe0FhBVA+qhUjVslaEAXymgZ8Gcifafh
         /eXw==
X-Gm-Message-State: APuU4Z8aGil1qrDbY3JXZwep3wQGyNLzfcwwkcn2KgsvC0HCEVBukXFt
	R6QVm0mfjKcNHFRfVwlD9dO8avfelbdTNdE/QkejNEO6+Cr/K9uQFa2uUp9XX+bTk+cORMyhF4Q
	2rqvZotwKHNnVAMmpWXtpD3jvxWp75fzk+8DImxiGPj2QVGcU4DKwdvOM7GjcZEuYY43nj2A/b2
	3+6w==
X-Gm-Gg: AZFdTZcElO2ye1rLpEk56Vz9fkqD3XmyjnpdAyEsZTAhWrcLcLLXDFF84mSlqy3XSAi
	C351PFOSd3ZKh/Qfj1+aeiOxvk9rICyb5yrrtfvpng1jZpx38EykaqP5+W+uYexFOxfWLjNiV/H
	tzXIpg5DpN1nHhtqzpV7ZVKhWs94XWwkkIbI+wfNcciQ/xkrQfjp4ZIg4+Ij/Fm21cquOdnwbSK
	kPG4VohwRhmiKTKhr0gH0c7npWVhm1kP+0ls2hmTCm16GRw2CIf9R1W7eRl7iAGmLn3SIEeo9K5
	x9gXdQlLh6RJf3yR54cFPG0degbXXS945/jpY7Lt16a11/FB4qhO0zNATOB7Ug3nOJwlgLFmP0E
	Ob6Y56TgnvwD6l9LA8luFNkEcq7kPGYohVdii+3BBjosV7q7usqXlkNq91J6o4DvHmC9UUleRwb
	ayL725C1KG3V7vMWnBa3tiWEn5of015g9F8gBPiyCosYG+l9R0pbp4wfcRsxGBUxKQE8GyHhCd
X-Received: by 2002:a17:90b:2f8c:b0:3ab:3437:554f with SMTP id 98e67ed59e1d1-3b41c92a519mr12320044a91.29.1795504416399;
        Mon, 23 Nov 2026 23:13:36 -0800 (PST)
X-Received: by 2002:a17:90b:2f8c:b0:3ab:3437:554f with SMTP id 98e67ed59e1d1-3b41c92a519mr12320016a91.29.1795504415740;
        Mon, 23 Nov 2026 23:13:35 -0800 (PST)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad46ef5sm21377318a91.8.2026.11.23.23.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:13:35 -0800 (PST)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 12:43:27 +0530
Subject: [PATCH wireless] wifi: mac80211: fix MLO sband lookup in
 sta_set_rate_info_tx()
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
Message-Id: <20261124-fix-mlo-sband-lookup-in-sta_set_rate_info_tx-v1-1-15df7534deba@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABY5BWsC/yWNywrCMBBFf6XM2gFTUhf+ikjIY6qjMSmZtBZK/
 92oy8PlnrOBUGESOHcbFFpYOKcG6tCBv9t0I+TQGPpjf1Kq1zjyiq+YUZxNAWPOz3lCTijVGqF
 qiq1kOI3Z1BWd00F7UoN2AzTlVKj9f7kLvLlQJBG4/heZ3YN8/dZg3z/sLiuWmgAAAA==
X-Change-ID: 20261124-fix-mlo-sband-lookup-in-sta_set_rate_info_tx-bb4d4ce154b5
To: Johannes Berg <johannes@sipsolutions.net>,
        Sarika Sharma <quic_sarishar@quicinc.com>
Cc: linux-wireless@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: QiSnT1TrOdMhXs11cd--Y6uoS1eWtn4Z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyOCBTYWx0ZWRfX/7M0iDLzef6E
 iaWnlY9LPGUrOOByVCbMsgxfhZNvvfV3Wspk2cVzHeMmcDKSnxqG9QWfvVGl44KZV77NiDNM6SP
 T9zZDCpnq9eBEXOjZd39wor0MHnu4bY=
X-Authority-Analysis: v=2.4 cv=JYspPkKV c=1 sm=1 tr=0 ts=6b053921 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=tc-TXUbGFWji84xB5HkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyOCBTYWx0ZWRfX6mbkmk6KAOuc
 AVbAOS0RukSfTCKktCIjzMks0n3LRQj6aCh/PQkWlrvbDrPWyKDJGTNc6UzPuhf7oPot19IXAsR
 TRisg8pn1E8F/xeT99+C2FkivZN/IW7bV6Nkjm93e+S31BirmvmihGSrrl32tEuV7lNVxcqs3oT
 C3vhL1EaYXyQBDE/tHEy08c3cChLC3TPOrJCNJcYCaRbUaosYIq5VfI6X1+5gvty7hY1njDV7Z2
 3OgWrxnl4hNybIR1Pmuke3Mf5AAN3prSo1auvnx3siImsz0Zsd+iNDx41+Q2ssnzOsbQmXbQY+X
 ez23VBaokSoW+taKdHvff0u15MEub0yySjKOd6Zdexc6I6V6hK7NcGoF2RrhBxvAYESnzyG2ZAp
 ijXGqFBw1Ig/QpAzU8vUrbYO9nAxdh+tJ/LkYiVRJBPX5yAWQQOhtGQDiQTI67SeYvn6eUBn08/
 u0c+H/l+U2GvT0Q7PAg==
X-Proofpoint-GUID: QiSnT1TrOdMhXs11cd--Y6uoS1eWtn4Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240028

When userspace requests station information for an MLO interface,
sta_set_rate_info_tx() calls ieee80211_get_sband() to retrieve the
supported band for the TX rate.

ieee80211_get_sband() warns when called for an MLO interface, since the
supported band needs to be determined for a specific link. This results in
the following warning:

WARNING: net/mac80211/ieee80211_i.h:1757 at sta_set_rate_info_tx+0x9d/0x17b, CPU#0: hostapd/430
CPU: 0 UID: 0 PID: 430 Comm: hostapd Not tainted 7.3.0-rc4-gf12af065cf81 #5 VOLUNTARY
Call Trace:
sta_set_rate_info_tx
sta_set_sinfo
ieee80211_get_station
nl80211_get_station

Pass the supported band to sta_set_rate_info_tx() and use
ieee80211_get_link_sband() for link-specific station information. Continue
using ieee80211_get_sband() for the non-MLO station.

Fixes: 505991fba9ec ("wifi: mac80211: extend support to fill link level sinfo structure")
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 net/mac80211/cfg.c       |  9 +++------
 net/mac80211/mesh_hwmp.c |  3 ++-
 net/mac80211/sta_info.c  | 10 ++++++----
 net/mac80211/sta_info.h  |  6 +++---
 4 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 9e47360ee8f5..5358ae40bb23 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -928,9 +928,9 @@ static int ieee80211_config_default_beacon_key(struct wiphy *wiphy,
 	return 0;
 }
 
-void sta_set_rate_info_tx(struct sta_info *sta,
-			  const struct ieee80211_tx_rate *rate,
-			  struct rate_info *rinfo)
+void sta_set_rate_info_tx(const struct ieee80211_tx_rate *rate,
+			  struct rate_info *rinfo,
+			  const struct ieee80211_supported_band *sband)
 {
 	rinfo->flags = 0;
 	if (rate->flags & IEEE80211_TX_RC_MCS) {
@@ -941,9 +941,6 @@ void sta_set_rate_info_tx(struct sta_info *sta,
 		rinfo->mcs = ieee80211_rate_get_vht_mcs(rate);
 		rinfo->nss = ieee80211_rate_get_vht_nss(rate);
 	} else {
-		struct ieee80211_supported_band *sband;
-
-		sband = ieee80211_get_sband(sta->sdata);
 		WARN_ON_ONCE(sband && !sband->bitrates);
 		if (sband && sband->bitrates)
 			rinfo->legacy = sband->bitrates[rate->idx].bitrate;
diff --git a/net/mac80211/mesh_hwmp.c b/net/mac80211/mesh_hwmp.c
index 0c9f0f476eb4..39464192ccc5 100644
--- a/net/mac80211/mesh_hwmp.c
+++ b/net/mac80211/mesh_hwmp.c
@@ -267,7 +267,8 @@ void ieee80211s_update_metric(struct ieee80211_local *local,
 	if (st->n_rates)
 		rinfo = sta->deflink.tx_stats.last_rate_info;
 	else
-		sta_set_rate_info_tx(sta, &sta->deflink.tx_stats.last_rate, &rinfo);
+		sta_set_rate_info_tx(&sta->deflink.tx_stats.last_rate,
+				     &rinfo, ieee80211_get_sband(sta->sdata));
 
 	ewma_mesh_tx_rate_avg_add(&sta->mesh->tx_rate_avg,
 				  cfg80211_calculate_bitrate(&rinfo));
diff --git a/net/mac80211/sta_info.c b/net/mac80211/sta_info.c
index e2ff3a242bb3..99d777b4930a 100644
--- a/net/mac80211/sta_info.c
+++ b/net/mac80211/sta_info.c
@@ -3202,8 +3202,9 @@ static int sta_set_link_sinfo(struct sta_info *sta,
 
 	if (!(link_sinfo->filled & BIT_ULL(NL80211_STA_INFO_TX_BITRATE)) &&
 	    ieee80211_rate_valid(&link_sta_info->tx_stats.last_rate)) {
-		sta_set_rate_info_tx(sta, &link_sta_info->tx_stats.last_rate,
-				     &link_sinfo->txrate);
+		sta_set_rate_info_tx(&link_sta_info->tx_stats.last_rate,
+				     &link_sinfo->txrate,
+				     ieee80211_get_link_sband(link));
 		link_sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_BITRATE);
 	}
 
@@ -3439,8 +3440,9 @@ int __sta_set_sinfo(struct sta_info *sta, struct station_info *sinfo,
 	if (!(sinfo->filled & BIT_ULL(NL80211_STA_INFO_TX_BITRATE)) &&
 	    !sta->sta.valid_links &&
 	    ieee80211_rate_valid(&sta->deflink.tx_stats.last_rate)) {
-		sta_set_rate_info_tx(sta, &sta->deflink.tx_stats.last_rate,
-				     &sinfo->txrate);
+		sta_set_rate_info_tx(&sta->deflink.tx_stats.last_rate,
+				     &sinfo->txrate,
+				     ieee80211_get_sband(sdata));
 		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_BITRATE);
 	}
 
diff --git a/net/mac80211/sta_info.h b/net/mac80211/sta_info.h
index 5fda4771eee3..b4913b9a6244 100644
--- a/net/mac80211/sta_info.h
+++ b/net/mac80211/sta_info.h
@@ -1010,9 +1010,9 @@ static inline int sta_info_flush(struct ieee80211_sub_if_data *sdata,
 	return __sta_info_flush(sdata, false, link_id, NULL);
 }
 
-void sta_set_rate_info_tx(struct sta_info *sta,
-			  const struct ieee80211_tx_rate *rate,
-			  struct rate_info *rinfo);
+void sta_set_rate_info_tx(const struct ieee80211_tx_rate *rate,
+			  struct rate_info *rinfo,
+			  const struct ieee80211_supported_band *sband);
 int __sta_set_sinfo(struct sta_info *sta, struct station_info *sinfo,
 		    bool tidstats, bool locked);
 

---
base-commit: 24630ff92eff08500ec4772728d4b1fa08c28f47
change-id: 20261124-fix-mlo-sband-lookup-in-sta_set_rate_info_tx-bb4d4ce154b5

