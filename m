Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983788;
	b=DXvVbIJqbjF+7FMyA9lqrT2RCkeNW8JSM6YDFgGDWC5aYGWb91XeHr4KgIgjf9aE5Elk
	 57USWShbMs/YI6lomXD6aVPPgX2QvXkfx9kZEI8XUMM+TnKn8+AJ2VzNa6OetD966LWn0
	 JRPKgxEnJEcWAY5bkHnFWijWCBp90tMbUB1wZMTdQptgS+A00koUkydfXFrKGHpk1F6OV
	 D8NbFEpFSR4VSwC4eK+iDRJjl74ESmzv5ZhFxPPXUfLflMmsBQ0SaiuUj2kEbqJ+nafNB
	 F/zXtS2Bugek26VV8s8dwAYRWHiorAooqnLk2b+oIPniOR4Am8VYXv2SYORvhDdCh/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983788;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=E8Cdb1nmvgEMOy98nttXzCKdGk2Aya+PM8D1dPE+u6o=;
	b=MBYY1/u7kP7m4lUxXVIYduSCO60Rjf3JhObifKElJ227w3uCKcUDM8ae6FlX3CCNvNUl
	 WrL+JuCLPUJYa+FnrBeJkp2+lNBedKHN42OartJInTTm2EukqBgUL97Ho/SGguiiJ+iDM
	 /c+gyvc84STai1/gPdSPHM5LZQuA/Ev8p5dZK9sJRIk9uscPNoxA5FwICZQPAmEFAYfIr
	 ZJ6OeiQXJPAXsyxsMbVh4zLtoVcgMAj/amscOrc0fkaPSwRWmYP3As9jguMSHpTHi14iT
	 g2+NecuB8Ca9QfQa5roE0mtFua8miXNSc5Hk5b0v9yC03eLPEqr/rsABub1AQoF3GVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p3K9ZUro;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UwYBGeuN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A66A606A333
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A66A606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p3K9ZUro;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UwYBGeuN
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UppY2383027
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=E8Cdb1nmvgE
	MOy98nttXzCKdGk2Aya+PM8D1dPE+u6o=; b=p3K9ZUroMBpjN1fzB17Fcqbk1/o
	pr4ELHCVY1SVdMUWB0zyYxI+YnSpqmIayy8Dzi8laWbfwov/nadQGSJzIXajY4wj
	6SdK73InKXOOQWN0DUTaB8qYbSqVnqPvDiFv+6jqIBHncyYdacsLAuNaVnWINAyC
	AJsUu3MZqBrhKpbdr0XXPoCFvAtF53QHz/IJpMPZ2n6xanrdA/4Syr4TgOAVYOf1
	wLzRb5+S9PMNVrbB0FqyUBCE11+EML6ky46K36l1vHYHeKDxaZtp/H9iJeJ74uuH
	+JUXa6WeCsrIM/p3ge/kz8I7Ht7CgA1oEBSIeNHoHl7BMBcCbWj0dvskXJA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvasmde-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:27 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36de26cb4b3so670147eec.1
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 22:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794983787; x=1795588587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E8Cdb1nmvgEMOy98nttXzCKdGk2Aya+PM8D1dPE+u6o=;
        b=UwYBGeuNcg/9bGfDxXphdCAkjiAXBy/BEgFv+PM2GGy6M7AS0sIsgpLanrcVfDAkyu
         0WE11ewhkC4RH5qmsciALg5HexKLbXS+Y1zvv4iue6QAXtHp+I3DgOVhNfth4Trxv5Ru
         XF1tqphHUwfPs2bJuVGsHcxIBWNg6k+aCoz7qhKO0kSnFoE2BMS7UPaNR2CiDshkfWQE
         GISJ0aRQ4GFZt4XS6pwURfQ5NS7u9TQL0LJw5L9A0wA6GLUyBTFXI/3T+x3KUQxw2Vrw
         M7/1MSdopL5DZLB+kez+l/CbCPfoWttT+nN1iBVSxeu8mkObrKGcjgln0Xg6Oz9q/+gr
         2NWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794983787; x=1795588587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E8Cdb1nmvgEMOy98nttXzCKdGk2Aya+PM8D1dPE+u6o=;
        b=OKHSOQnTCCY95gN9leQY6KO7V4fgly31Sni9xEJR2NadKi6a5DE3xA/KVn8mw6bpAt
         sZZC0wfuVe98atYmL16rW2As55MplirZoe8BO6Z5/M0W1q8l8KtuZ1vWbekijMs3KN6B
         1C88DpCyeHImWTRCz9P/Zpq9qPTcnJdY5LKKKkaNY1mY+MRN/Ex1jY8HWV3NrmCAhkQt
         BE194rvfbuLZl3kYHQH85Fyhe9/3Xf65nefC1+uCgs1I/bLGbufLLInTku7n8bX4ejjL
         tBThGlHj/YTAa5WcEVisgeYXGdOcyr2RYMiAeWFnmAWnkLetPt+yOltci3hifPpXSvNc
         cf3Q==
X-Gm-Message-State: APuU4Z/menKMRP3Pcxpl3d/hfZX0Lmtl8T72/ZBApYzgizBAB93/JtOp
	Ztw+3E2DG1AW073khTzDwBk8Yyf4PKvMwLYDuMYCYsLn3PozEb1e4OMh2GX2bzGtW/lRnBbNedB
	nqzlqyEmUocVB4pOt2LrXMJHeGdmsAigdHFuJGw86+sdKl9rMRUWTPPgFSbBeE8ngHcdPDJFyDT
	VvOA==
X-Gm-Gg: AZFdTZdBrD9pIidtw7eFgbcsm5uBFRHS+OtV1tp4EFOQaHGSYThlbj5BqDRx+qVzHUF
	Pa+I5wBkbBigRgs/tpNdQUFr0hcwmwnrnyvBHPdepsnyWuxe9cYl6+zGYot5JQdfPJ/n0IHQJPu
	9E98rxvAbwD14t4RfxgxQLmoppZPUemrmyG9s62TuKjERWfXo6JCEMuZd0hGoStlUTt4W221OW4
	QPmSbmlq8jVenvbfya8hAczuh3t2/heIjSfe2eLfkI1pa94yFCwb7Fq1LWhCYGvhJa5nWh3vY6J
	HKYJ/2pG/HGXHZMlVOdY3UlWErTwgIwK7qUMMxVcfUwZom98k7FZN4mrCGjbZ53rMSB1A6jAm4f
	8men1NZgdGK2kZ54tpxevba7FOAKbWnPI9E705uDlp+DUTRoFxyx/xKoufMBppmnR/6+F7rjkyV
	iWtV+YePRNKg==
X-Received: by 2002:a05:7300:f405:b0:381:ad6f:75ea with SMTP id 5a478bee46e88-3828101fdb1mr1642029eec.13.1794983786537;
        Tue, 17 Nov 2026 22:36:26 -0800 (PST)
X-Received: by 2002:a05:7300:f405:b0:381:ad6f:75ea with SMTP id 5a478bee46e88-3828101fdb1mr1642014eec.13.1794983786020;
        Tue, 17 Nov 2026 22:36:26 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6800338sm4567268eec.11.2026.11.17.22.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:36:25 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com, vganneva@qti.qualcomm.com
Subject: [PATCH wireless-next v4 05/19] wifi: nl80211/cfg80211: advertise NAN ranging support
Date: Wed, 18 Nov 2026 12:05:40 +0530
Message-Id: <20261118063554.2260397-6-shivani.baranwal@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=SMzXx+vH c=1 sm=1 tr=0 ts=6afd476b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=AEF9MEfIqb847dwsdnUA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: -yWmyYOavQtfO1k6PW1TqtmFnxchplfO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNiBTYWx0ZWRfX4z55WNmfVFdO
 eva1slQiMdBDCy+JfpHfnBkpOOwNU6ec16IsS2Yp3mkVERAMnNFpw5vszZ4TOELladPXId9qtIO
 w+ATxS06OlrAwTTqohrSAGpwxqJGe2ALI2Z4bjhjgSz3wgZ9lFRJj/FM0E6WZWYVikixIB/J1TB
 U7m3XJcYOVT3yIlBHpV/pueEFOqpsuGzRjKDqAtfKuzKm4L8pxMj1FZvDGXM4wDbIcMUl6ajtzS
 0GBFMyXXYr09KSjw6wgBGfxiEWytUNDthJl5YHdycs7F8gnbYMMZ10b+hI0LEJNNFOOrkM/HFPt
 upRYpbEyw+2j03BUnD1tj3jCFjgnd2M8ApAD5xnJoLLIkJY1QdAKt3yvYYsmrJTghu/h7x1IQQU
 VCBtZo8bUszqqBHdKizy2ckXgs6z5yRUafZmTNYxdFwMfCKRWB70Tk94l9WTcy63SHJkubJ43x3
 vv06qpnxdMIRpz+gC0g==
X-Proofpoint-ORIG-GUID: -yWmyYOavQtfO1k6PW1TqtmFnxchplfO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNiBTYWx0ZWRfX7fu1BUsso5LQ
 Sp147GCaJE9ER51ye0872qHZXu02pVWnvMOemuVTTBluiCkbpN1rzjxp295RyzXweMNHKxyPQi2
 BXntqz708Fxh6WKKX5XEJxNiTRgIf9o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180026

From: Kavita Kavita <kavita.kavita@oss.qualcomm.com>

Add NL80211_NAN_CAPA_OFFLOAD_RANGING so userspace (e.g., wpa_supplicant)
can determine whether firmware supports fully offloaded NAN ranging
before starting a NAN ranging session.

Add WIPHY_NAN_FLAGS_OFFLOAD_RANGING for drivers to report this
capability and expose it through the NAN capabilities handler.
Fully offloaded NAN ranging includes ranging session setup, update,
and termination, FTM protocol and procedure, and ranging report.

Signed-off-by: Kavita Kavita <kavita.kavita@oss.qualcomm.com>
Signed-off-by: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
---
 include/net/cfg80211.h       | 4 ++++
 include/uapi/linux/nl80211.h | 4 ++++
 net/wireless/nl80211.c       | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index db175abf9a24..b4a1aadf3639 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -6451,11 +6451,15 @@ struct wiphy_radio {
  * @WIPHY_NAN_FLAGS_USERSPACE_DE: Device doesn't support DE offload.
  * @WIPHY_NAN_FLAGS_INSTANT_COMM: Device can switch to Instant Communication
  *     (IC) mode. Can only be set along with %WIPHY_NAN_FLAGS_CONFIGURABLE_SYNC.
+ * @WIPHY_NAN_FLAGS_OFFLOAD_RANGING: Firmware supports fully offloaded NAN
+ *	ranging procedure, including ranging session setup, update, and
+ *	termination, FTM protocol and procedure, and ranging report.
  */
 enum wiphy_nan_flags {
 	WIPHY_NAN_FLAGS_CONFIGURABLE_SYNC = BIT(0),
 	WIPHY_NAN_FLAGS_USERSPACE_DE   = BIT(1),
 	WIPHY_NAN_FLAGS_INSTANT_COMM = BIT(2),
+	WIPHY_NAN_FLAGS_OFFLOAD_RANGING = BIT(3),
 };
 
 /**
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index b982cb29f89e..baca5b0cb8ca 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -9297,6 +9297,9 @@ enum nl80211_s1g_short_beacon_attrs {
  *	of the Wi-Fi Aware Specification v4.0. Can only be set if
  *	%NL80211_NAN_CAPA_CONFIGURABLE_SYNC is set. When IC is enabled, the IC
  *	schedule is expected to be configured by user space.
+ * @NL80211_NAN_CAPA_OFFLOAD_RANGING: flag attribute. Firmware supports the
+ *	fully offloaded NAN ranging procedure, including ranging session setup,
+ *	update, and termination, FTM protocol and procedure, and ranging reports.
  * @__NL80211_NAN_CAPABILITIES_LAST: Internal
  * @NL80211_NAN_CAPABILITIES_MAX: Highest NAN capability attribute.
  */
@@ -9311,6 +9314,7 @@ enum nl80211_nan_capabilities {
 	NL80211_NAN_CAPA_CAPABILITIES,
 	NL80211_NAN_CAPA_PHY,
 	NL80211_NAN_CAPA_INSTANT_COMM,
+	NL80211_NAN_CAPA_OFFLOAD_RANGING,
 	/* keep last */
 	__NL80211_NAN_CAPABILITIES_LAST,
 	NL80211_NAN_CAPABILITIES_MAX = __NL80211_NAN_CAPABILITIES_LAST - 1,
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 1bb2782b6206..ab8ec24093ac 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -3206,6 +3206,10 @@ static int nl80211_put_nan_capa(struct wiphy *wiphy, struct sk_buff *msg)
 	    nla_put_flag(msg, NL80211_NAN_CAPA_INSTANT_COMM))
 		goto fail;
 
+	if ((wiphy->nan_capa.flags & WIPHY_NAN_FLAGS_OFFLOAD_RANGING) &&
+	    nla_put_flag(msg, NL80211_NAN_CAPA_OFFLOAD_RANGING))
+		goto fail;
+
 	if (nla_put_u8(msg, NL80211_NAN_CAPA_OP_MODE,
 		       wiphy->nan_capa.op_mode) ||
 	    nla_put_u8(msg, NL80211_NAN_CAPA_NUM_ANTENNAS,
-- 
2.34.1

