Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285223;
	b=cok/qVwyHb5xfS6dGFc3X1pczsDVPdY7oEGHGvU1x27bIxcbmpu1Jd1Fixu/b4ebqXU7
	 In9gezGGRTjb7gcGNL2jgStFkWNJ3iZ3zMXt3BDPWR3UbeXvVvt0e8muQbEaSeq6EO834
	 NDUV/TEAKJZ8e3BgDhVgAHK2pYtQQZvc8fN0sPAUB2oX93oGBTOJO3n2UijN2wWKRabPF
	 kD/G7k2picDFsj8qxHP7fqqS/9IY+Eh4FdAV00G0xhXQSlVaxl+1rbECwLo2r8hiFUGjw
	 JMtZDcKlqlMyl5xLEGKhXmLEEbOLDyHmdwe5HmUIqNmcPGzE0JcF6kcSuiQT2zL7RVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285223;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xZPtCtjsexycvUofww/67JbF+el7MQk9g2Nm7RsL4k0=;
	b=xP1Hd+dmYzlvuGTU8vcTgMy/OPwVWIysgOPsDgHxPEOe+caCQaMe8qgIUayl/YEBmb6J
	 Tf9xGaAPYAZ8aaCkPNhyznzAQMcTsO7fVETqd0x6Ndb3NbfI6TBeCMsQT+xnWJAtA7EkQ
	 hV/iYtuM5Bm51ECBXgc9JGpojyOZwReC/6sttvTy5kF2KFee0NUMue2tV9/djp7zE2KCK
	 90vPE8J3a4XdzPGykEArRM2HhaAyPwVgxgaaTsJJ4wSRo+maz7zcVjzC0KBiyJ7kZ+eI8
	 P45dlp3UsEFgDvSpHM0rZFHDaViUBU6QbtlsGaiR8q2jy6q5LdAjPetsqYc9CfQ6v8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RJIwqVPm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ign2wCPV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E07A60A2614
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E07A60A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RJIwqVPm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ign2wCPV
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A1VM3267987
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xZPtCtjsexy
	cvUofww/67JbF+el7MQk9g2Nm7RsL4k0=; b=RJIwqVPmrzWZ81QwOv3PMaidCNw
	+rmZ80o9xscizedRAPAlW9sac50G386szAw/HZAQM18jX2yuWHjMD2T+1XG43Edm
	NbIBQRlLJO23OYqxm99vUyAdF6T3GNyuEJKrKiDO2ISnfmK1y9ikxg7rHenyHrPS
	enDOaDVLkYsmc4P+hsgG3WRuRLvXLls+0XaWiYiYX+yHm2c/vOSpn8JVXYlDUcTT
	iuBHbmyo7xLLnX1vntQrrOCrW0vXqFDi1wDQlhubWzYewZyLQDZgUzJTUeqbl/rB
	6xKv1Bcrbqa2GlX0z6FqXA1rXj2ikVCNqjxUmeOO4xXNpVarQ4XjpMCHZWA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hue0qu9b5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:42 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36ecd5db581so843810eec.0
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 20:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794285222; x=1794890022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xZPtCtjsexycvUofww/67JbF+el7MQk9g2Nm7RsL4k0=;
        b=Ign2wCPV/CsRhlI/SPqEKSONOHFG+TXeuSfIhpKnhwLr0O1QskKbtgmw9RtyYtExCH
         J96skCzIc7Uzynm8D5Q36P7sZikUIrVtgGr/332Q7NuLb3Moqbe78XgV0kvwIY/RqXpv
         5B0PNCbQhZWrvc/kEGM4H1aeY4458dA4GTrI0ABmojgli4znF+jZohgUjoMEccAsI/DO
         6eUoARChm/2htGoVm1B1Ijh/aY0xGhJIc4W8yfxG8uGki38asGvvCKHbOCIPL3A+LV6k
         Od+o8/NWk7HyXu+S4ryfl5X+P48dGmSc0UbSaG0mS/B6bdPQY/A1HpEMAbGgnamLeUcI
         ChtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285222; x=1794890022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xZPtCtjsexycvUofww/67JbF+el7MQk9g2Nm7RsL4k0=;
        b=pMYo6gQ1Wi79U+dZGn3EEU4xrw81udLNlYfH/iyGngeSfzKhctSXXSFOkUbI/klupx
         7ZGzGSf2OhljD2glXwoWBrqc9mPNDnCvqJkmRu2ldEgQdeEF3tdtRzJGClFNJ2EaPsrE
         43tuH/dpn5W8UMFBE3AomvKFegrY4RnLwSTYQL/Pg1k9V1nr+NAqsgZJpQUgEqt8Nb1L
         gCY09V1ftXrTkSG5n4xIwDB2uHJbZAzMOTKJcSopBWEO9+hUtyVsnUE05SrKjgE6cNhV
         uQfrWi21mwdKKgZrH9hKETJRVbFF6Lw2f6IPG767xWVBY+zO20Dj6VO6zr+o+gJwzXX2
         uzdg==
X-Gm-Message-State: APuU4Z/LaZtOlGituu+xcwA/o42gyEUFvbtvLS15w1hg0gLE+lVmrMAU
	7L/L9zU5041SNBNPGmaaCp2BHwX+Dd2AI9hwHKoEpYqXtgLFPUy42f1+iuH/f8l4GnS5Xv8FtQ5
	nf3vqMXrsya7O86qBiYsxS4c4fpi/b5AXBOvl2XRz8LnH1qWttoa6h4HA34qlJGYZw2rhdUn5BS
	2WOA==
X-Gm-Gg: AYBFou3aFYRs5g7v22SmEYERBe9ey+Vn72qcArV+/9HFAx8EFKvZXMFX+MSjMNmRSgY
	xP2VAOEegcqgWHsfgizA4bX2i9CTMLhiElZNC3gfzEBzzh8fcd3eDuI8khpI5u4M/WtignU0a0t
	f2Q9wgvt1Uec1rAy46ku1OJjuP0SDhaleI7gcNqdlBABndGWRlcl5LZ8fT1MCWRmFrBltS7wx33
	YSZJPcz2tByh1q9/kFMMulG1WFckHI/FK65nNS0WIa1o9S1Bcju7eVt6d79d+NfAnX6vTN/OcIG
	raT7mWLWAj2roWVvizcSTAGA1ldwacAnMXR3JtIUaZWttC0SSmWsWSJ26MC/uVir0Sl+r2QMrX7
	8wwc3ycm3zjMzqqJogNyLwH1pFQzgv+Hd75NAkrRcZVviBkvloVS0dxUuzj9qVK+A96R5hvzgpN
	OkIbJ9deSJXg==
X-Received: by 2002:a05:7301:5f17:b0:36e:20ee:b288 with SMTP id 5a478bee46e88-3751eb8b097mr1810513eec.12.1794285221703;
        Mon, 09 Nov 2026 20:33:41 -0800 (PST)
X-Received: by 2002:a05:7301:5f17:b0:36e:20ee:b288 with SMTP id 5a478bee46e88-3751eb8b097mr1810468eec.12.1794285220685;
        Mon, 09 Nov 2026 20:33:40 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm3548618eec.17.2026.11.09.20.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:33:40 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com
Subject: [PATCH wireless-next v2 18/19] wifi: nl80211/cfg80211: add NAN group key capabilities to NAN functions
Date: Tue, 10 Nov 2026 10:02:41 +0530
Message-Id: <20261110043242.2012238-19-shivani.baranwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110043242.2012238-1-shivani.baranwal@oss.qualcomm.com>
References: <20261110043242.2012238-1-shivani.baranwal@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxNyBTYWx0ZWRfX/C2WIp59Fqqy
 Cc2/ojgEo6nerU5TPwJ7VhIJB2d8WF+uygIce2f7fxir1Sc8MgpuqA09GqlSvPLFDnTPmbUfYTn
 bJlxsVhWO75orVZUwIvpKxJvYxkcSioXhcdqzEJPD+shZPR4/hzzURxVa2iQLYshk4kIDDe2MSC
 f21LukcHtteKdJcHqp6lDQDyygtxW9s75UcqUkUFP+kq44wj8ZOuqehNzGC27IBl9CFkdmDNxvR
 QzNxAGpb98Ej98EFytWXJeeMWgLcB2DmiW98qrbEPzQn0gLRyWZbprAA3ueBn6MpFTZbzs1+4Ia
 WUwEd7jNcDJIaxRuImmP8RZ46fWzF7qvmluXbN0tqfRSoflySxWcrrTC2JsNsziCbiWwW4r5zm2
 d96EWW6K2D6oIWF8J/kGPjom4GC6LjWHMfM6vQAdNwEKtO4Oi5vbbchoemN53k5OTsBDb0BrcIh
 zs9QkeQZRt2co/WzqQw==
X-Authority-Analysis: v=2.4 cv=DZuCOftW c=1 sm=1 tr=0 ts=6af29ea6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=WFFLawxlNp6tfJMvWTEA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: h3RcPyMdCv9bCT904nQaE49n5RHH3sHl
X-Proofpoint-ORIG-GUID: h3RcPyMdCv9bCT904nQaE49n5RHH3sHl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxNyBTYWx0ZWRfX/xh/LPTsMhen
 ge1e0iwaZu/RhAO37GijlLwe1gp6sivh+ysLM4lqmlGMmH38sAO8v2v88InPFSdp0f0j2ZswrJK
 DYbUIgAJiaZfrwBYuvDO/tBWnb25Ikc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100017

From: Vinay Gannevaram <vganneva@qti.qualcomm.com>

A NAN service advertises in its Cipher Suite Info attribute whether it
supports group keys (GTK and IGTK, optionally BIGTK) and whether IGTK
and BIGTK use NCS-BIP-GMAC-256 instead of NCS-BIP-CMAC-128. With an
offloaded Discovery Engine and NDP setup, the device builds this
attribute for the Service Discovery Frames of the function and for the
NDP setup frames, and it distributes and installs the group keys during
NDP setup. So far, NDP offload only covers the GTK, which is requested
per NDP.

Add NL80211_NAN_FUNC_GROUP_KEYS and NL80211_NAN_FUNC_BIP_GMAC_256 to
configure the group-key support of a function. The device also uses it
for NDPs of the service and establishes the group keys that both peers
support; the per-NDP GTK requirement and GTK cipher are unchanged. Use
typed attributes rather than the raw capability field, whose other bits,
such as the number of replay counters, are properties of the device.

Signed-off-by: Vinay Gannevaram <vganneva@qti.qualcomm.com>
Signed-off-by: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
---
 include/net/cfg80211.h       | 36 ++++++++++++++++++++++++-------
 include/uapi/linux/nl80211.h | 41 ++++++++++++++++++++++++++++++------
 net/wireless/nl80211.c       | 18 ++++++++++++++++
 3 files changed, 80 insertions(+), 15 deletions(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 75fa387f3a0c..6154b9c06029 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -4358,7 +4358,8 @@ struct cfg80211_nan_peer_sched {
  * @pmk_len: length of @pmk in bytes
  * @pmkid: PMKID (16 octets) to include in the NDP Request, or NULL if absent
  * @gtk_required: if true, GTK protection is required for group-addressed data
- *	frames
+ *	frames. IGTK and BIGTK follow the service group-key support, see
+ *	&struct cfg80211_nan_func.group_keys.
  * @gtk_cipher: GTK cipher suite ID, valid when @gtk_required is true
  * @ipv6_intf_id: IPv6 link-local interface identifier, or NULL if absent
  * @ndp_id: output NDP ID assigned by the driver on success (1-255)
@@ -4413,7 +4414,8 @@ struct cfg80211_nan_ndp_initiate {
  *	@cipher_suite and %NL80211_EXT_FEATURE_SECURE_NAN.
  * @pmk_len: length of @pmk in bytes
  * @gtk_required: if true, GTK protection is required for group-addressed data
- *	frames
+ *	frames. IGTK and BIGTK follow the service group-key support, see
+ *	&struct cfg80211_nan_func.group_keys.
  * @gtk_cipher: GTK cipher suite ID, valid when @gtk_required is true
  * @ipv6_intf_id: IPv6 link-local interface identifier, or NULL if absent
  * @transport_info: if true, convey @transport_port and @transport_protocol to
@@ -4471,7 +4473,9 @@ struct cfg80211_nan_ndp_terminate {
  * @ssi_len: length of @ssi
  * @cipher_suite: initiator's cipher suite ID
  * @pmkid: PMKID from the peer's SCIA attribute (16 bytes), or NULL if absent
- * @gtk_required: if true, initiator requires GTK protection
+ * @gtk_required: if true, the initiator requires GTK protection. IGTK and
+ *	BIGTK follow the service group-key support, see
+ *	&struct cfg80211_nan_func.group_keys.
  * @gtk_cipher: GTK cipher suite ID, included when @gtk_required is true
  * @ipv6_intf_id: initiator's IPv6 link-local interface identifier, or NULL
  *	if absent
@@ -4619,7 +4623,20 @@ struct cfg80211_nan_func_filter {
  * @security_required: if true, the SDEA Security Required bit is set. Requires
  *	@data_path_required and %NL80211_EXT_FEATURE_SECURE_NAN.
  * @gtk_required: if true, the SDEA GTK Required bit is set for GTK protection
- *	of group-addressed data frames. Requires %NL80211_EXT_FEATURE_SECURE_NAN.
+ *	of group-addressed data frames. This is independent of @group_keys, which
+ *	advertises service group-key support. Requires
+ *	%NL80211_EXT_FEATURE_SECURE_NAN.
+ * @group_keys: group-key support of the service, advertised in the Cipher
+ *	Suite Info attribute of the Service Discovery Frames of this function, as
+ *	defined by &enum nl80211_nan_group_keys. With
+ *	%WIPHY_NAN_FLAGS_OFFLOAD_NDP the device also uses it for NDPs of the
+ *	service: it advertises it in NDP setup frames (an NDP initiator uses its
+ *	subscribe function) and establishes the group keys that both peers
+ *	support. If zero, no group-key support is advertised. Requires
+ *	%NL80211_EXT_FEATURE_SECURE_NAN.
+ * @bip_gmac_256: if true, IGTK and BIGTK use NCS-BIP-GMAC-256 instead of
+ *	NCS-BIP-CMAC-128. Requires @group_keys and
+ *	%NL80211_EXT_FEATURE_SECURE_NAN.
  * @pairing_bootstrap_methods: bitmap of supported NAN pairing
  *	bootstrapping methods per the Wi-Fi Aware Specification Table 9-321.
  * @csids: array of u32 NAN Cipher Suite ID (CSID) selectors supported by
@@ -4678,6 +4695,8 @@ struct cfg80211_nan_func {
 	bool data_path_required;
 	bool security_required;
 	bool gtk_required;
+	u8 group_keys;
+	bool bip_gmac_256;
 	u16 pairing_bootstrap_methods;
 	u32 *csids;
 	u8 num_csids;
@@ -6682,10 +6701,11 @@ struct wiphy_radio {
  *	and security handshakes. It negotiates the NDL and manages local and peer
  *	NAN schedules, including NDC and immutable schedules, ULW, schedule updates,
  *	and evacuation of its own channels. It assigns NDP IDs for locally initiated
- *	NDPs, derives, installs, and removes PTKs and, when requested, GTKs. The
- *	device creates and removes NDI peer stations for offloaded NDPs. Userspace
- *	must not configure NAN schedules or add those NDI peer stations or their
- *	keys. The driver implements @nan_ndp_initiate, @nan_ndp_respond, and
+ *	NDPs, derives, installs, and removes PTKs and, when negotiated, GTKs,
+ *	IGTKs, and BIGTKs (see &struct cfg80211_nan_func.group_keys). The device
+ *	creates and removes NDI peer stations for offloaded NDPs. Userspace must
+ *	not configure NAN schedules or add those NDI peer stations or their keys.
+ *	The driver implements @nan_ndp_initiate, @nan_ndp_respond, and
  *	@nan_ndp_terminate callbacks. It supports %NL80211_CMD_NAN_NDP_INITIATE,
  *	%NL80211_CMD_NAN_NDP_RESPOND, and %NL80211_CMD_NAN_NDP_TERMINATE, and
  *	reports peer requests, setup status, and termination with
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index 66894f79148b..c56428ce721a 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -7787,6 +7787,17 @@ enum nl80211_nan_publish_type {
 	NL80211_NAN_UNSOLICITED_PUBLISH = 1 << 1,
 };
 
+/**
+ * enum nl80211_nan_group_keys - NAN group key support
+ * @NL80211_NAN_GROUP_KEYS_GTK_IGTK: the service supports GTK and IGTK.
+ * @NL80211_NAN_GROUP_KEYS_GTK_IGTK_BIGTK: the service supports GTK, IGTK,
+ *	and BIGTK.
+ */
+enum nl80211_nan_group_keys {
+	NL80211_NAN_GROUP_KEYS_GTK_IGTK = 1,
+	NL80211_NAN_GROUP_KEYS_GTK_IGTK_BIGTK = 2,
+};
+
 /**
  * enum nl80211_nan_func_term_reason - NAN functions termination reason
  *
@@ -7852,7 +7863,9 @@ enum nl80211_nan_func_term_reason {
  *	%NL80211_EXT_FEATURE_SECURE_NAN.
  * @NL80211_NAN_FUNC_GTK_REQUIRED: flag attribute. Sets the SDEA "GTK
  *	Required" bit for GTK protection of group-addressed data frames.
- *	Requires %NL80211_EXT_FEATURE_SECURE_NAN.
+ *	This is separate from @NL80211_NAN_FUNC_GROUP_KEYS, which advertises the
+ *	service's group-key support in its Cipher Suite Info attribute. Requires
+ *	%NL80211_EXT_FEATURE_SECURE_NAN.
  * @NL80211_NAN_FUNC_PAIRING_BOOTSTRAP_METHODS: u16 bitmap of supported
  *	NAN pairing bootstrapping methods as defined in Wi-Fi Aware
  *	specification Table 9-321. Each bit corresponds to one method. Requires
@@ -7888,6 +7901,17 @@ enum nl80211_nan_func_term_reason {
  *	uses include the NAN Identity Resolution attribute for pairing
  *	verification in Publish and Subscribe messages. Requires
  *	%NL80211_NAN_CAPA_FUNC_EXTRA_ATTRS.
+ * @NL80211_NAN_FUNC_GROUP_KEYS: u8 attribute, see &enum nl80211_nan_group_keys.
+ *	Group-key support of the service, advertised in the Cipher Suite Info
+ *	attribute of the Service Discovery Frames of this function. With
+ *	%NL80211_NAN_CAPA_OFFLOAD_NDP the device also uses it for NDPs of the
+ *	service: it advertises it in the NDP setup frames (an NDP initiator uses
+ *	its subscribe function) and establishes the group keys that both peers
+ *	support. If absent, no group-key support is advertised. Requires
+ *	%NL80211_EXT_FEATURE_SECURE_NAN.
+ * @NL80211_NAN_FUNC_BIP_GMAC_256: flag attribute. IGTK and BIGTK use
+ *	NCS-BIP-GMAC-256 instead of NCS-BIP-CMAC-128. Requires
+ *	@NL80211_NAN_FUNC_GROUP_KEYS and %NL80211_EXT_FEATURE_SECURE_NAN.
  *
  * @NUM_NL80211_NAN_FUNC_ATTR: internal
  * @NL80211_NAN_FUNC_ATTR_MAX: highest NAN function attribute
@@ -7925,6 +7949,8 @@ enum nl80211_nan_func_attributes {
 	NL80211_NAN_FUNC_CHAN,
 	NL80211_NAN_FUNC_RANGE_REPORT,
 	NL80211_NAN_FUNC_EXTRA_ATTRS,
+	NL80211_NAN_FUNC_GROUP_KEYS,
+	NL80211_NAN_FUNC_BIP_GMAC_256,
 
 	/* keep last */
 	NUM_NL80211_NAN_FUNC_ATTR,
@@ -8143,7 +8169,8 @@ enum nl80211_nan_conf_attributes {
  *	it carries the PMKID received in the peer's SCIA for cached-PMK lookup.
  * @NL80211_NAN_NDP_ATTR_GTK_REQUIRED: flag indicating that GTK protection is
  *	required for group-addressed data frames. Requires
- *	@NL80211_NAN_NDP_ATTR_GTK_CIPHER; IGTK and BIGTK are not covered.
+ *	@NL80211_NAN_NDP_ATTR_GTK_CIPHER. IGTK and BIGTK are set up according to
+ *	the group-key support of the service, see %NL80211_NAN_FUNC_GROUP_KEYS.
  * @NL80211_NAN_NDP_ATTR_GTK_CIPHER: u32 GTK cipher suite ID. Required if
  *	@NL80211_NAN_NDP_ATTR_GTK_REQUIRED is set.
  * @NL80211_NAN_NDP_ATTR_IPV6_INTF_ID: binary IPv6 link-local interface
@@ -9457,11 +9484,11 @@ enum nl80211_s1g_short_beacon_attrs {
  *	negotiates the NDL and manages local and peer NAN schedules, including NDC
  *	and immutable schedules, ULW, schedule updates, and evacuation of its own
  *	channels. It assigns NDP IDs for locally initiated NDPs and derives,
- *	installs, and removes data path keys (PTK and, when requested, GTK). The
- *	device creates and removes NDI peer stations for offloaded NDPs. Userspace
- *	must not configure NAN schedules or add those NDI peer stations or their
- *	keys. In particular, %NL80211_CMD_NAN_SET_LOCAL_SCHED,
- *	%NL80211_CMD_NAN_SET_PEER_SCHED, and
+ *	installs, and removes data path keys (PTK and, when negotiated, GTK, IGTK,
+ *	and BIGTK, see %NL80211_NAN_FUNC_GROUP_KEYS). The device creates and
+ *	removes NDI peer stations for offloaded NDPs. Userspace must not configure
+ *	NAN schedules or add those NDI peer stations or their keys. In particular,
+ *	%NL80211_CMD_NAN_SET_LOCAL_SCHED, %NL80211_CMD_NAN_SET_PEER_SCHED, and
  *	%NL80211_CMD_NAN_SET_NON_EVAC_CHANNELS are not supported. The device
  *	supports %NL80211_CMD_NAN_NDP_INITIATE, %NL80211_CMD_NAN_NDP_RESPOND, and
  *	%NL80211_CMD_NAN_NDP_TERMINATE, and reports peer requests, setup status,
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index e1dac3d912ff..66ce4bc3e3a0 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -1458,6 +1458,10 @@ nl80211_nan_func_policy[NL80211_NAN_FUNC_ATTR_MAX + 1] = {
 		NLA_POLICY_VALIDATE_FN(NLA_BINARY,
 				       validate_nan_func_extra_attrs,
 				       IEEE80211_MAX_DATA_LEN),
+	[NL80211_NAN_FUNC_GROUP_KEYS] =
+		NLA_POLICY_RANGE(NLA_U8, NL80211_NAN_GROUP_KEYS_GTK_IGTK,
+				 NL80211_NAN_GROUP_KEYS_GTK_IGTK_BIGTK),
+	[NL80211_NAN_FUNC_BIP_GMAC_256] = { .type = NLA_FLAG },
 };
 
 /* policy for Service Response Filter attributes */
@@ -17789,6 +17793,11 @@ static int nl80211_nan_add_func(struct sk_buff *skb,
 	func->security_required =
 		nla_get_flag(tb[NL80211_NAN_FUNC_SECURITY_REQUIRED]);
 	func->gtk_required = nla_get_flag(tb[NL80211_NAN_FUNC_GTK_REQUIRED]);
+	if (tb[NL80211_NAN_FUNC_GROUP_KEYS])
+		func->group_keys =
+			nla_get_u8(tb[NL80211_NAN_FUNC_GROUP_KEYS]);
+	func->bip_gmac_256 =
+		nla_get_flag(tb[NL80211_NAN_FUNC_BIP_GMAC_256]);
 
 	if (func->security_required && !func->data_path_required) {
 		NL_SET_ERR_MSG(info->extack,
@@ -17798,6 +17807,8 @@ static int nl80211_nan_add_func(struct sk_buff *skb,
 	}
 
 	if (func->security_required || func->gtk_required ||
+	    tb[NL80211_NAN_FUNC_GROUP_KEYS] ||
+	    tb[NL80211_NAN_FUNC_BIP_GMAC_256] ||
 	    tb[NL80211_NAN_FUNC_PAIRING_BOOTSTRAP_METHODS] ||
 	    tb[NL80211_NAN_FUNC_CSIDS] || tb[NL80211_NAN_FUNC_ND_PMK]) {
 		if (!wiphy_ext_feature_isset(wdev->wiphy,
@@ -17808,6 +17819,13 @@ static int nl80211_nan_add_func(struct sk_buff *skb,
 			goto out;
 		}
 
+		if (func->bip_gmac_256 && !func->group_keys) {
+			NL_SET_ERR_MSG(info->extack,
+				       "BIP-GMAC-256 requires group key support");
+			err = -EINVAL;
+			goto out;
+		}
+
 		if (tb[NL80211_NAN_FUNC_PAIRING_BOOTSTRAP_METHODS])
 			func->pairing_bootstrap_methods =
 				nla_get_u16(tb[NL80211_NAN_FUNC_PAIRING_BOOTSTRAP_METHODS]);
-- 
2.34.1

