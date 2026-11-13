Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794594003;
	b=mFRYdO4KQoNbIy5wARz4e9oOOOFDqDZFSKACIh50LdRBcOb0ESPfBJZPCFyfO5EKKwlZ
	 7VVsJUSTmQ+PdBOzcvGhbkVcMxTEyWsqgYMKV2hoz+WxKFbJAiUsnA/82IrdqDhV/hnsf
	 N51XCYzhKDo4C+4wFZQd7GkIkQwlwKxTAKVgNdYSpbukWkcjPDzEeBFWLwd0ilaX9+RXY
	 UxM/HGjlrzNPW5lAbZwsJy4SO7LvZiwK6ghLEoOKs8L0lYR9VVytSvDbKUe9OB3S5T6xy
	 oUAEhZ1FvV6V4o9rX+qtP0MnnFfsaT1xY5xcgTwTePuE02SNqF29rDTqSWy3LvW20kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794594003;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Lc+M+xeSWFmNgJrag+pyxq6yWGejUKhFy+lMV3S6Pbk=;
	b=drPoEkyvLIQp4ycYlEqfOSShl7jjE/nXxiX0aHfdsvfLSSBD1FW2MSRXRbjVq0xWKOzf
	 XBf56Rl695dvt1Qxfnj6iqzFrqf/veYfavMC2H791KYoKUuytTgZqBbjSRrYMdw4Fou9k
	 sGUCIgDrBOJdVR4dIywn3eTotOyHTy/4s/hGD9Jc043odICVJxPSntnRp7QM2Qb+6QUhE
	 w/5sF/6wtcT+wWslgDj6zmjb15x0WcJwL4Urzm75/kHr0AqF+68sdOj557TE+sXBR2v3G
	 8fkIIh/yG0AhzQXoHNs6x8EQNo4aF4KeSZzQgAZ//Bj4xy5nTqxphQiQ5spJD87NFxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="GtYGTsq/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VXuibiXw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843DF606A6FB
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 18:20:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 843DF606A6FB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GtYGTsq/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VXuibiXw
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR50A1189956
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 18:20:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lc+M+xeSWFmNgJrag+pyxq6yWGejUKhFy+lMV3S6Pbk=; b=GtYGTsq/XWnTnkK1
	yJGIY10GmMfnla23Y69I4f9PPzFqbzkyJUu2EA+fOP2RYQ92GlIb/G6toOw6MYld
	C7tRIyY9qWlf6K8TKQfb8uEfy8WgBws+4ERDnk0D+cYWWtSry6xCmO/geD/mQcpW
	UsMtNyp7JaMxkc2gd4q9OU+7GY6VU3jPRtfcde4fQuCDHrFRrVGUO4KvBhwp4ofZ
	kfyh6xAGcetHKWNgKpMoQ1CjMzLY2E+addy6ERV1+VJaII71gV9IL8I2zoIQ0fgL
	NO014vOusphBnkORyNVDc27bEy1eMwJ+mErnw0/R67NDz0O+v9pJn26YXjrZvbLC
	KeXqcQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufkkpy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 18:20:02 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a3451ea93so1273400eec.1
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794594002; x=1795198802; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lc+M+xeSWFmNgJrag+pyxq6yWGejUKhFy+lMV3S6Pbk=;
        b=VXuibiXwsMUkIxEY8H3x+5+3sGZD4Lid8/eoqPFkwBLxBzBtA8/muPRC1vGCR4HzGg
         w/47cRbmSPkDhQgsIVmpLu3tLtaKMW19v++PT79olepdBNZrau6mRVcN1Y1YiPOYuvXN
         +mUy1I3Yskmu+oaJsoo9P5EKjUSKVIU/2Y2okI+V2AmSizhlKuHDrLsukotJQ+1Pt2fh
         1ODJhDPjTSOI/0ZkE2O7tdln8lmGX5Y9WIBRuhT35VI2S2GGPQqitMLNKAdNE1hVtJRg
         xyaNcAq7Pt+Ri5XlTe/UiJvApycYbO9mQQK+Kmcb8QNSs5aHNduXZVZFf+A4znNsWWO+
         bS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794594002; x=1795198802;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lc+M+xeSWFmNgJrag+pyxq6yWGejUKhFy+lMV3S6Pbk=;
        b=SZlfF07u6rJTGEV1u0PI1pZ5j5nL4MzRtgFPvGvzYNa4a4SfU9PgrXVYdkXHz9cMVC
         +F6Ml8o1muqgz417YqZre3KmbT8padsaDw+/Z7DRI7bJLdi5982431VJmHiyuAT/FsIV
         +mEJrtTlXwqpQZVeZD9cQ3bQys1kFm92xhnrNCVUz+HGunBjNLI/UQSRe1RP76/HNhxp
         vGgYoG59suZOuvN/sCljyPQ7eCvI/Rdr2fqXQRN4kKEyvQWznvlncYAv6F9ZxLqIE/Up
         9k6zyiClkZBAnXyFN8V9m1N3UmNHceAxyrlkqBaUwRZ1LdFDwdj7bPDQhlNbf4lrNify
         M66Q==
X-Forwarded-Encrypted: i=1; AL+hErEtDu0lEt7tXct0Y/eXdaVfDL2+otAgiMauN0zBrXT5x2fYvR8viREwg75I0YankpVTsxbsmSwp7vQonOTsUg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9BC1H3R2ZtaIKCvNuIgWHFdjzN4GVvop30PNuPllrf/JZqokVF
	dCvIzBDIOgly0rf1tf8Mh8Nzg9e0skAtQF5R/IFJSXxpbc65U4M+kVxW42lWLUQrjnIECdPwCbR
	Hjo26AnSaL2FXiozAuz0CWxuRIzKQ2+9aFKDVuaU1qCctV7O4+4jvgIpK3R+t2duOaKP8
X-Gm-Gg: AYBFou31iryKRo+yUni79K+iYAFWzyz+nI+3RcDlFlGwRsj9P5+RiSONSRO3u185Cdh
	sAeFs8WGL4KUK6fjt3Pks17ec7Kll+NKAkLVjUhcll+CdWYWHt2BVvsakjmSj7TTiRpGWXkLz2K
	yjzohkd7t08e3CArF3BwynGtWOE4U2t0aJRlaIrJfa7PDceP0jdY+4822A/gk6xB7BIx3rV7y1p
	cLUQwedx9wTciBlyMkDWlTWwSkQB+5dFcEtksqoz9g0/Dg9BCxf8HHnilKM+kQlApYVvSk5DZSP
	t5jtYKQbDVwnPM44DfDWXHVp9vfs0K9+QhK/zCRuoAMAzMD3BnH6l6FnjWmAPzFyQKVp3yWLkor
	MGbe2VpDnhzgfFqmHsB2qx0OBbx1Ex0dBLajHcIldMpEbtnXyVjlhf2AL1Jsp9EuExs8UdjuA7I
	zeReiLpKlgUdbwyhJw9e+Lavr/2KOWj2W+Oc5IKsvlXkYO+d86SwBCqsopUSZ4YvsjVw==
X-Received: by 2002:a05:7300:fb8c:b0:376:a62b:ae09 with SMTP id 5a478bee46e88-3796676a1e8mr3880947eec.16.1794594002005;
        Fri, 13 Nov 2026 10:20:02 -0800 (PST)
X-Received: by 2002:a05:7300:fb8c:b0:376:a62b:ae09 with SMTP id 5a478bee46e88-3796676a1e8mr3880923eec.16.1794594001412;
        Fri, 13 Nov 2026 10:20:01 -0800 (PST)
Received: from [10.50.62.158] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm17285676eec.20.2026.11.13.10.19.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 10:20:01 -0800 (PST)
Message-ID: <a509d2e4-c192-443f-a6b8-587efca47ffd@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 23:49:56 +0530
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next v4 08/21] wifi: nl80211/cfg80211: pack SMD
 dynamic context along with frame
To: Allen Ye <Allen.Ye@mediatek.com>
Cc: Johannes Berg <johannes@sipsolutions.net>,
        "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jouni Malinen <jouni.malinen@oss.qualcomm.com>,
        Aditya Sathish <asathish@qti.qualcomm.com>
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
 <20261106-smd-v4-8-62e39487f51a@oss.qualcomm.com>
 <ea313f0127e2cfa72a3572f1893e59c6e2c22cd1.camel@mediatek.com>
Content-Language: en-US
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
In-Reply-To: <ea313f0127e2cfa72a3572f1893e59c6e2c22cd1.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: M2z6jsdlCjz3J2UHEonamJo-1gb1klAO
X-Proofpoint-ORIG-GUID: M2z6jsdlCjz3J2UHEonamJo-1gb1klAO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3MyBTYWx0ZWRfXzR0hZQ+B2sVt
 JjGfVzyH385ol3Sn/zCpendakPKehewPSxzDa7tCuKjxCtFWbrd2/JLp/8V4HDpaP7jV4qhnUaF
 TQgiQNTvlOLUvCOTMqZa6DDqF8xf74qK3d34pMjhpt5Rreouh151ZljKGAlElI2fQrYG/ffLzsR
 oIlacHKAiHmBRTOAutjtUG7L9Q6QDHocFv1Na9QLX4kcuvYg+npc/zU1QoLgAnTkUuzwYg9JTN5
 ZMmDYFeaMcGUIOj6Saok9+Wv+4uGUViVvy8+DoRRxNw/V8V59fxBm4VRruv666j4TV6WuBUD5cn
 Xg7gvWRFu73+e3PD8eTgRr6G0gnvQFFUywizKj9AHHPXDK8jNhIJDGszUgMVIOqFrOCEwoJWbpj
 9yUVD6pEQgNBiS3BdjZWFrg6lkJ1Q8PiScgv+tZ0LT9mMLcUuz9e/r2rQKrBCz+Bj+LtHolOOlv
 H7/RP+bfwgykas6D7jA==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af754d2 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=eljfwrJUAE9ARPuycr8A:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3MyBTYWx0ZWRfX33nggEUrY9IX
 oQOs516TH4EIAjODXhwUpquG7UZpm2aUFVp7HdQktPfxHMjSb7xF4P1zasWE0MdoyOnBVfi7I2A
 89JeEXaLDK+z8rSWoQLgzLmwn4d6WoI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130073



On 11/11/2026 02:44 pm, Allen Ye wrote:
> On Fri, 2026-11-06 at 13:28 +0530, Pooventhiran G wrote:
> 
> Hi Pooventhiran,
> 
> A question on how the context is collected here.
> 
>> While packing the received management frame in nl80211_send_mgmt() to
>> send to userspace, nest the SMD dynamic context along with the frame
>> message.
> 
> On MediaTek chipsets (mt76), the dynamic context is kept in FW/HW, so
> the driver has to fetch it from the firmware with an MCU command. This
> means the driver has to hold the ST request frame until the firmware
> replies with an event, and only then pass the frame up. Holding RX
> frames in the driver is the problematic part: the frame has to be kept
> outside the normal RX path, kept in order with the frames that follow
> it, and handled if the firmware reply is delayed or never arrives.
> 
> 1. With the context attached to the frame, how it gets collected
> depends on each vendor driver's own implementation (on mt76, this may
> mean holding the frame in the driver as described above). If userspace
> instead queried it via GET_SMD_CTX / SMD_CTX_EVENT for ST preparation
> and ST execution via the current AP MLD, as it already does for ST
> execution via the target AP MLD, the flow would be the same for every
> driver, regardless of where the context is kept. Would that be
> acceptable?
> 
> 2. If not, could the frame-attached context be optional (e.g. behind a
> capability flag), with userspace falling back to GET_SMD_CTX?
> 

Hi Allen. Sure, that option could also be added if some drivers choose not to
pack in the rx_mgmt frame itself. Since it will be a fallback, I can change
hostapd to directly query the driver for context using GET_SMD_CTX if it does
not find the context attached to the received frame?

> Thanks,
> Allen

