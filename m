Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983787;
	b=ArOE3rzN4zNvEtgKsHa4lbeaY4lfHGRj+kOH3vaR2A49VcWNVn25PnKsBGKOgqeOQoHK
	 kK2H9reWv4Z6b9ZrTYQppozSLYwobdsHTAhxYugGDSyjzD9So3YFfK+eQD7CpjenrJAOg
	 5utR9Wzzl4ckRfNmcqTiOhY1fU2G/ToMc6dWAmftydBzl0q/b/ukzibru9dFIKouUvAq0
	 T+t717B81BJ52UUIpQm+HDOOs/5ouK6LUQ3MF8Ps/RULtuFTeTwfsu4WmfjntilK6PywF
	 8WoE/lhyVi6n0lx48Tx2JbtFh1MG208pV9QjSYjNLX30aFGpWx4Tq6/prN4QtlGSRLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983787;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7BCeUzifsE4aG+oosytiHCzTy7JkV9sWalde1tHJKkk=;
	b=3q6stgIjfROlzWm8I15uzZcgmgEUaP6hHr6Ql5BCjg+OhYdKuK/Oam2qeDDkbCkYyfh6
	 s1X91vycuRfRqTYZnDP24zkTbmpdVYduVThA073fF5V2BKaHd8TVlUo9sPM9VCeU6dTSK
	 atomjUlq6wi9HRs7zwpDza+qRdONIy709guGle0q2Fpa0Yg7LA1nkCTODC+PK+ai0c3nn
	 RFsVWov8D8JG+i3WnKVUEP4VVtjB+IWyADMCsbZjy/1cLE9I7ObkPkAtXtfKfnt8IqflM
	 0cuh6c9pl8LWZx0Lk5L6g77qp3fRS7epHo4B8pVPtwlvEElXGRMvQ0R39rlnnA/Q/SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bAnALJTr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kf7xqYgE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEB5606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEEB5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bAnALJTr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kf7xqYgE
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V5da764232
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7BCeUzifsE4
	aG+oosytiHCzTy7JkV9sWalde1tHJKkk=; b=bAnALJTrYdd5LCe/NVSCvq0qRPi
	Zip7SkRj2qVtcUypnAhLq9PqGkZ7yJG+ESXEyq9aGvoqFZZ0hl7HAwgjdNOjNSb2
	L5axpi+CCXbpgJW2emA+FBKH9LWlhzLpaO9buF7l23EBW/YhP3R91IQRo651uzz3
	3KatKF5jDWcB58UTVD0bIEbrFbIA99IQF5Kmg+eXxzMN2GEIn2UzkDkTH4nNyUKA
	3l1Y5r4A+bt6gtO6RuOtEEKO8F+bWjjf75hKP9IbAIEGiLG7+Xulk2WpGANyVJt5
	LDuW0vc8dzwM+tYQDnx+83pzkVeSH837lEpG1YLyKgkGDabUpj+Jex+tavA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvb9k97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:25 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36fa5673fccso1964260eec.1
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 22:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794983785; x=1795588585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7BCeUzifsE4aG+oosytiHCzTy7JkV9sWalde1tHJKkk=;
        b=kf7xqYgENJp7kszqII0aq2epRjlgjNypW0PEqvvhET+4Zfa79t1rc8AcS3unrXGvMx
         hCt3NlcT+ycAHVQddRJt/EMmyjV/UbGszTFy5Fzu6LC0IwbeOhoy/tZKvHXZMQT9U5sp
         BwqfTKd3mR28MqoFI+/ckTMI1vlK6TbjInLpArxrqr9l24VnxLnNkQiCGehbGvOx9In1
         lGv+aayVlU3g29Cm5/lPJ7P36A6nAi17Jdd4oAqJyZJSdUkRwJfqnUWlDVrd/xHnHR/y
         1zdK2/Q6XONs5oyfiXkOdGO483SkFixsVajRqA54yor394i/nVWKZY5bdoNGjG1gtIHt
         zB3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794983785; x=1795588585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7BCeUzifsE4aG+oosytiHCzTy7JkV9sWalde1tHJKkk=;
        b=kZsvtaruMnkPLIjZSlY6sBq9P6uIE7tC2Ncaa1tWvrqpGBvw43sBv/6bEow7V4qUU+
         PThII0/pI++2zHjYQ6mMzatpT00wSSnojNyUSsV0wlqZbuPcMBhxwYNAJufhNLIRWkeI
         XUMzxL3QhbT2418A1WTkcRQQS8pztAFhCk4Q4FPOSNkQDkkD+k3l5JIWzO6m3PhPb7qo
         20mFLYbtZmfMgteedAOoxisMRxbdjmCTt20BPSHGkH1quoUIUI0XZk+wNRx8//z53aqK
         j5sNFpaX7DrtmjMeG8pd7sH+9v13mJ2hhLiglZG85N9Sn0nh02ElNXrTV9xnJrYRgD7P
         qutg==
X-Gm-Message-State: APuU4Z9+f9w5aeyruMkwt8srt+L5e+QkiEB823PIzdZbBVKIMxsHqIR5
	l6HT0wzi32FYJeduwJfKSkwo+A55TzAE5B6JJ1T26hllpsfSNEhk+yRrV+t1OC1PuypLtuFKZjX
	YTsAV83Ol3aCvo7Vd63WcQ6hTd6whv8cLJLNCYaKlK5SnSV7lvvywy+DqCMY0EEGdytaDhA==
X-Gm-Gg: AZFdTZeU+6fQqBMFKaZZflctQEDlNChHAh2YQZKMFd8INXHJGhUsTOZKH7TyEldVFqS
	KDTWa1+PVXQ5VoMD9sUSrDurJkkl8C5Zis3r+s+fGV5/Wh+jrdlod5fTah/q5nUN34ACL3bN+SQ
	2KSVvyTGL3TIOgIDODnyd6vg80KRIVbOElf6BCXweQoZaxPSNsVp75WgLcvMRXy5YuAgkqp7J5w
	f4JRhwrQr4KZcXpX5GLTVVwMnsE4uEPmYsZVz9F6GFTHoMckxd9drlWYIo8J7Z46COiTA0RGudi
	CsrwNhVJD5h/6hMmNHGuKZpWkwAAKayP0pVwQPJ/GaEeHjGMx5g8akgbonSUGvTv2hhYQ6XaUX/
	/1oxNWA5YDvS6qNdpLP0i6bHhjMQO4zVu1TfjmWnrk9OjDv+KATWF1KpPLzNEo9ya37D9W0l/gu
	vyXJqmrDvkkA==
X-Received: by 2002:a05:7300:f286:b0:351:2958:1740 with SMTP id 5a478bee46e88-38281dedee0mr1620765eec.37.1794983784551;
        Tue, 17 Nov 2026 22:36:24 -0800 (PST)
X-Received: by 2002:a05:7300:f286:b0:351:2958:1740 with SMTP id 5a478bee46e88-38281dedee0mr1620738eec.37.1794983783601;
        Tue, 17 Nov 2026 22:36:23 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6800338sm4567268eec.11.2026.11.17.22.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:36:23 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com, vganneva@qti.qualcomm.com
Subject: [PATCH wireless-next v4 04/19] wifi: nl80211/cfg80211: add NAN ranging FTM capability
Date: Wed, 18 Nov 2026 12:05:39 +0530
Message-Id: <20261118063554.2260397-5-shivani.baranwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118063554.2260397-1-shivani.baranwal@oss.qualcomm.com>
References: <20261118063554.2260397-1-shivani.baranwal@oss.qualcomm.com>
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
X-Proofpoint-GUID: iSDnW681sXZwmfP1WvFsDEE8q60Ff7cJ
X-Proofpoint-ORIG-GUID: iSDnW681sXZwmfP1WvFsDEE8q60Ff7cJ
X-Authority-Analysis: v=2.4 cv=YfgodARf c=1 sm=1 tr=0 ts=6afd4769 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=tHaWkjuROnUFulaCi40A:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNiBTYWx0ZWRfX5cbpGBWcZnxr
 +JZooLpqKSQww9V7dqbiVtrFIMCgk0vhLkJJ/TKvjAiYXS72tl+A+X/4MMFYutqTmjtxHdBNUQt
 4gNB+OXLIm7hH1rQKmKeEplHf7HG0kw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNiBTYWx0ZWRfX3udTn9H8K80A
 +h/0n554daad2B78rpaw0nvEXoYEo9BAFDoZApCu9eXKCAN19g5PUWnBbU7mLZwlR+QeCVEEwtC
 unvf1UdCBJ4Qra6bXVymI22lQVoEvBKRBc1/VKh2X5dCKceXKO11PgFs/VuQV7TV4VUNQ7wld3e
 6rKT2R248j1wSmwJONePsklsF/pGgh11NoRVRh6zDfXFPocBv6SrXhzI8ztdxjneRENAs743fUW
 uv9B0MauuHUtTCA4Cy2dDdexFVm1rKH9+JElUZO9IVWbbq38z6qg9o2XM6tjVU9D7keZobTWhzH
 HS9idOHsIOUeV0kg8ntBpY9rIWg+ZC/kTN9TbWUJ4Jjhbx90hYoW6Glka84XcPqF9aWiIwvvMQC
 FTo1bwWVR/X8b6Da+1OyIgASijO7a6Bbvmda67SVtPrau+yqXdppSE/+NT2rZy68IJDW2q5WgIX
 5fNvH7MvSQQMX8eqA8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180026

From: Kavita Kavita <kavita.kavita@oss.qualcomm.com>

Add NL80211_PMSR_FTM_TYPE_CAPA_ATTR_NAN_SUPPORT to the FTM type
capability enum so that userspace (e.g., wpa_supplicant) can query
whether the driver supports FTM-based ranging within a NAN Ranging
Session before initiating a NAN Ranging Request.

Add the corresponding nan_support bit to cfg80211_pmsr_capabilities
and include it in the capability advertisement in
nl80211_send_pmsr_ftm_capa(). NAN ranging always uses ASAP and a single
burst, independent of the generic ASAP capability.

Signed-off-by: Kavita Kavita <kavita.kavita@oss.qualcomm.com>
Signed-off-by: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
---
 include/net/cfg80211.h       | 6 +++++-
 include/uapi/linux/nl80211.h | 6 ++++++
 net/wireless/nl80211.c       | 7 ++++++-
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 9f412fee8fe8..db175abf9a24 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -6314,6 +6314,9 @@ cfg80211_get_iftype_ext_capa(struct wiphy *wiphy, enum nl80211_iftype type);
  * @ftm.type.pd_support: supports peer-to-peer ranging as mentioned in the
  *	specification "PR Implementation Consideration Draft 1.9 rev 1" where
  *	PD stands for proximity detection
+ * @ftm.type.nan_support: supports NAN ranging as defined in
+ *	the "Wi-Fi Aware Specification v4.0, clause 8". NAN ranging always uses
+ *	ASAP and a single burst, regardless of @ftm.asap.
  * @ftm.concurrent_ista_rsta_support: indicates if the device can
  *	simultaneously act as initiator and responder in a multi-peer
  *	measurement request. Only valid if @ftm.rsta_support is set.
@@ -6364,7 +6367,8 @@ struct cfg80211_pmsr_capabilities {
 		u32 min_allowed_ranging_interval_ntb;
 		struct {
 			u8 infra_support:1,
-			   pd_support:1;
+			   pd_support:1,
+			   nan_support:1;
 		} type;
 		u8 concurrent_ista_rsta_support:1;
 		u32 pd_preambles;
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index c30dcba96763..b982cb29f89e 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -8535,6 +8535,11 @@ enum nl80211_peer_measurement_ftm_capa {
  *	the device supports peer-to-peer ranging as mentioned in the
  *	specification "PR Implementation Consideration Draft 1.9 rev 1" where
  *	PD stands for proximity detection
+ * @NL80211_PMSR_FTM_TYPE_CAPA_ATTR_NAN_SUPPORT: flag attribute indicating
+ *	that the device supports NAN ranging between two NAN devices as
+ *	defined in the "Wi-Fi Aware Specification v4.0, clause 8". NAN ranging
+ *	uses ASAP and a single burst, irrespective of whether
+ *	%NL80211_PMSR_FTM_CAPA_ATTR_ASAP is advertised.
  *
  * @NUM_NL80211_PMSR_FTM_TYPE_CAPA_ATTR: internal
  * @NL80211_PMSR_FTM_TYPE_CAPA_ATTR_MAX: highest attribute number
@@ -8544,6 +8549,7 @@ enum nl80211_peer_measurement_ftm_type_capa {
 
 	NL80211_PMSR_FTM_TYPE_CAPA_ATTR_INFRA_SUPPORT,
 	NL80211_PMSR_FTM_TYPE_CAPA_ATTR_PD_SUPPORT,
+	NL80211_PMSR_FTM_TYPE_CAPA_ATTR_NAN_SUPPORT,
 
 	/* keep last */
 	NUM_NL80211_PMSR_FTM_TYPE_CAPA_ATTR,
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 3375aea01e0c..1bb2782b6206 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -2793,7 +2793,8 @@ nl80211_send_pmsr_ftm_capa(const struct cfg80211_pmsr_capabilities *cap,
 			cap->ftm.min_allowed_ranging_interval_ntb))
 		return -ENOBUFS;
 
-	if (cap->ftm.type.infra_support || cap->ftm.type.pd_support) {
+	if (cap->ftm.type.infra_support || cap->ftm.type.pd_support ||
+	    cap->ftm.type.nan_support) {
 		struct nlattr *pd_caps;
 
 		pd_caps = nla_nest_start_noflag(msg,
@@ -2809,6 +2810,10 @@ nl80211_send_pmsr_ftm_capa(const struct cfg80211_pmsr_capabilities *cap,
 		    nla_put_flag(msg, NL80211_PMSR_FTM_TYPE_CAPA_ATTR_PD_SUPPORT))
 			return -ENOBUFS;
 
+		if (cap->ftm.type.nan_support &&
+		    nla_put_flag(msg, NL80211_PMSR_FTM_TYPE_CAPA_ATTR_NAN_SUPPORT))
+			return -ENOBUFS;
+
 		nla_nest_end(msg, pd_caps);
 	}
 
-- 
2.34.1

