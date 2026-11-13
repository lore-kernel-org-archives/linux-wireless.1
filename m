Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794597849;
	b=UF0HxgdNkgrCqRL63QgAzQ6BHosBg41XjlGNytp6kahBkeuwmyyxNtifP4GKh7l+4jFx
	 XsHVEZHw2/B98tsar2La0/6Y6XBBYUzsSRatHLTELRX2T4Xfhu/1ZOPIWvqgqtzvxRdX/
	 LufljgWSZLrHOkuqFnR45Ufmpu5yz6L1JQ/uZ7mkoqLW9RbJCCEnYQ8AqGv+JcNBv8IEY
	 P76oB7JipvPBPCMMisSPK1/G/fuT0tTsJQuS0wfel6zDnGA71jrtqJFE/gRZTbzt8i4rF
	 A3kLMHmHTZTSRagvgOo0SQH7vvqqSrMr7xI8wtfwRZ/zgxl1SQwOfjiJEDKFO8zYkxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794597849;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=KQkvq6Okk4UxT3NN1mheA+Sz9vObc3OWacNEYJlAWnQ=;
	b=nyPHmVhd75gQH8u144uvGNq7N7CAGA0shQ6k5QrWmY04GCTvSTAfMCkfZ316CpaVuR6x
	 OFlegK1ep6gJL0otMlOKC8MVVssLpkliX5X7rn0hGiVtcowwxMIxshbRnuwwjoRiwveig
	 0wrFR4dNCqycy2+Ba+RnSqfwCzxVCZzdDCd5HYfMt+1I2t3JZSJDZWnjcqPZIzRIAK4i/
	 eShrel6zXGooZUwXISSshzuXxsoZUuGWibUOUtZ+sD8RhfDhO/xY4xxKRiwDXrK1jpjsO
	 7ky8XdYM6k8Re+EEaGSW4zZmGVefigwYg90WFVR0M1Q01WIf98HNFesWnlzFMPPHG6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JNF+d14H;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dwKwVoiV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B5E606A32D
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 19:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19B5E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JNF+d14H;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dwKwVoiV
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADJ085l1745379
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 19:24:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KQkvq6Okk4UxT3NN1mheA+Sz9vObc3OWacNEYJlAWnQ=; b=JNF+d14H0akvrtY2
	dBG1L6h9x9i1nQ9TXT+lqfWFN2YD/67tt8dQPR+fC7sY1p4TVSZrR/dDg5tV6nnn
	hGLNSLMX9cJpiXMUQGBU0QgGui5H7jfaCg/wShDQUlleAej+sKIZ6SVOHZw1iT8u
	J4KdIA2dw8UGVj6/L+nCIsgmk+Aqp90W9hCXJGehEpYYfk9IFkfnt6d6Cy1Z92wg
	pTS3FezldHMs7bHb9V863gxv27nJKyYNT18DOpSE8bUR32odgSCncjzwB8Yllevh
	W265Sf0EL6AqTEferutZ50cHsRTnHp0SYiuGRR83VOFXr0mVAp0tJ9OrCSdujId0
	mjyw5A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufkuxp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 19:24:08 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so1795815eec.1
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 11:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794597847; x=1795202647; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KQkvq6Okk4UxT3NN1mheA+Sz9vObc3OWacNEYJlAWnQ=;
        b=dwKwVoiVPpXedFJqt7wkFjacKgdVtb4JMOXFaUUw9U2PX4jQvxMmvxOf9nLnrjFvxc
         7Kh6+gmt1OQA+sgh+/xN1KeMmYV7uhA40eXkiIozwEJ+NbFsyQzDQ7lyUrFwEUQW6Vtv
         Dwnb/APNT5Fqd+HtWh91H1IxsRK8qP/Dyq0XdDc08cd/q5OqYmX/UGnobPPxJI5u/i3m
         v+eLWfcF6jLSn7dMF6QezStKia7CVsM/Jzn6kxzkI/SX6zE+mgqwrEHsatBz/cW0OVMl
         EMwIIazO2LAu04/MSFGJiDxh3VrKmpuZSZnaXscHp2AlLDeOnIGyTqHuwwEFRiJSAa5b
         d1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794597848; x=1795202648;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KQkvq6Okk4UxT3NN1mheA+Sz9vObc3OWacNEYJlAWnQ=;
        b=djokP/wnTKThTTkK9NlZn+8S3PkLklHFjHCOrcTk9H8bzATURiMz0090cDsNG6i9mP
         K374rJ80wx4o9XjubrRbRXqR0RhpZRh+sbBmSd0L6tDQOLyJvEAyxAFOFpzgwfupak9d
         Qj1jpnBv+EpQl2jweSuxEKsqkH0rnjGu0s9xmMxQUOygzWTZrEizHQY+ah9WfS7T2ZnL
         cxNTcGPLU2tDCU8qX9GplDbQITpvUmC0STlwpuL2NpWfIRTyJ6X0LQpqr/6y9f8fiCoE
         DzDdOLmA/5q/qX2zCr0mLwit6d/Glhg+7x1xlBqcX+Q0AYnEbaYXurodjjDvIvurxen1
         9hjg==
X-Gm-Message-State: APuU4Z/4WCuLY8GW9Aw2b2JeUtmruFbDjmRbOxMHM5q++54X5QbM1F8A
	DywtM5UlbVPRZ2nr0EWosqhh7a8Wm6TDSz1Q0GiSUTnwphxWhDTCNkOg057vfIQ5BF98V47LhoA
	TAaFuktbMrw1OH+G9XDkRjrZRkTyCYtd4o9FCDRuh3wTsWiDUGRXrxi4ue8w32USfBqTY
X-Gm-Gg: AYBFou3QR36jx6v7PLlWZHSAnwIESnsuRtr7CdXX7AG7vODAuNNXFKInfggbHLa7xEA
	gsGsHVu7xblDNCrtzgqEkG7+Vn8myh35zAyr2IdkiugpIQkU2r8RF0I879TbmpYQDdGrU5dc6pY
	LkA0PzQzmyqbD3AnLUHUYSK6Kgpk1NqZ9xL8xxxULx+fHTzX6Kos3cFbkjBvOVwNKWaOs2XdsJB
	CPNzRVKVlDoDDNmRr/IsKhyODbZ6mc3YxB24egRdXmlPnfp1yL98nkH3qb4vfPAriDTF+cODNou
	Qlaakk1D80w0r/Ms5qnAoB6eOES1nCbaDhV5oXjY8UZ26KzNrI4Y58jjlFPIIIoSuRg91/X+QSQ
	LUpTIXYbLAHOkNtfEKw1fpKgdts3CmjxD/Ns5DrUwlZOfU05JvYi2cKfTrj3AF/W/71TsQqAjuh
	XyLim4dVx8fNTrGbp9soUXygPMolrfSCmDRN73XsUt2Zuk/80OjkFRwxhnavIpDOwbFQ==
X-Received: by 2002:a05:7301:1a05:b0:369:f035:661 with SMTP id 5a478bee46e88-37967315a1emr2612293eec.15.1794597847225;
        Fri, 13 Nov 2026 11:24:07 -0800 (PST)
X-Received: by 2002:a05:7301:1a05:b0:369:f035:661 with SMTP id 5a478bee46e88-37967315a1emr2612274eec.15.1794597846546;
        Fri, 13 Nov 2026 11:24:06 -0800 (PST)
Received: from [10.50.62.158] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm8826385eec.22.2026.11.13.11.24.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 11:24:06 -0800 (PST)
Message-ID: <aa2b9f1c-61bc-4908-a509-9b3d3f269e5e@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 00:54:02 +0530
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
Subject: Re: [PATCH wireless-next v4 21/21] wifi: mac80211: define API to
 invoke SMD Drain Completion event
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
 <20261106-smd-v4-21-62e39487f51a@oss.qualcomm.com>
 <60c815e5020502b91215a6c89c589d881e80d67e.camel@sipsolutions.net>
Content-Language: en-US
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
In-Reply-To: <60c815e5020502b91215a6c89c589d881e80d67e.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Hbto9OIvHiKSOfVeGYqRVYIh5n5hYpKL
X-Proofpoint-ORIG-GUID: Hbto9OIvHiKSOfVeGYqRVYIh5n5hYpKL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NyBTYWx0ZWRfXxzEO25Hjp7cJ
 CrtNDC5WacKJCBajQHBqFJTRCTIjDfgkJrGDtK3KHUCI6F1+Y79N03xRdHfnFulmUQDrv/7nCF3
 r9IZolo+Y0K0xzjNRIMGAX+sUw/K0o0Gqp1RWzcl7MSEv0TllUgTCu905C0apuWbNS8IXsWhNhF
 RAXAGqWTsonLa+WHcPJy3fCsN6rD5/E0MV7iWGUNj3Z2yRNsr020HuhfmsEymG1obKvbESfyQtM
 KF7gSrnW1+wfGgEe9o/ukpucWz0RyyxgqDyxNIXLhBc9fcwSfBTTjIpl01pq2RwN75HaGQc3xQi
 5wr6UR/4M6HUGky84wPQh/efMmZEsm7Wt/obiH71/WjQIFCcluSrydW1lSrGPsTSKKC40vNv0Hq
 YJucXBbdMZH06IhPQhpFzdSzg7ee40voeQi5fuxRl0iw8Liq7ub1qctBl57LJqWATcz5jtko/DB
 Sgjdes8n+as5OB6CNBg==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af763d8 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=PkGQRqP1AohgGE1IAmgA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NyBTYWx0ZWRfX1EGSLcMAv/2k
 As5CX+M/Daq/sEDe4/Ll7oGihAJMiImRPUE3d4+QeTFWbNJ5aNS+21iSw3E+bkPUx5ZlJfWOL/D
 2j47WYAu3U0R1Gs0xHN/J/z4RL4ZlDY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130077



On 11/11/2026 02:19 am, Johannes Berg wrote:
> On Fri, 2026-11-06 at 13:28 +0530, Pooventhiran G wrote:
>>
>> +int ieee80211_notify_smd_drain_completion(struct ieee80211_vif *vif,
>> +					  struct ieee80211_sta *station)
>> +{
>> +	struct ieee80211_sub_if_data *sdata = vif_to_sdata(vif);
>> +	struct sta_info *sta = container_of(station, struct sta_info, sta);
>> +
>> +	lockdep_assert_wiphy(sdata->local->hw.wiphy);
>> +
>> +	/* doesn't make sense to terminate if we are not draining already */
>> +	if (sta->smd_state != IEEE80211_STA_SMD_DRAIN)
>> +		return -EINVAL;
>> +
>> +	cfg80211_notify_smd_drain_completion(&sdata->wdev, sta->addr);
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(ieee80211_notify_smd_drain_completion);
> 
> I don't really see anyone checking the return value of this, and if we
> don't think we need to protect hostapd from broken drivers, then this
> could also just be an inline (or not exist). Anyway if it goes wrong the
> client will just hit the timeout without much loss.
> 

Yes, it was made to return an int especially because of the ST state check.
But an invalid early-termination cannot (need not) be handled here and the STA
can just timeout. I will clean this up.

> johannes

