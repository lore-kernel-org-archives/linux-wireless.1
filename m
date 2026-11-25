Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596990;
	b=XX+uVZl+tsWM0tiXul4Yrd3RbiMBjh3KbRqp4+MzzKJ1Ru0douye1ILaGrC37enHgxm0
	 O8jzbMFQd+NSUElaoFdifIH1ogGhMLt45f/Uz5r3qZnySSse4uiglFy/tPnsciVBD7zWA
	 9EV6fpQb3ILIKjUrX4ObmRrIPGMRMQVs1uF165xWnGWfbskgRAr8FZGh23cmcDxNccO3z
	 O8LZHhOs1LX/h8R9K7OPWaytiqr0gpiHUIaeCKMs+79gOjBCPNUudYTTFbMUGcMQtpRJ3
	 XBgUlHPA0p3Z7lbFeqOhUiTi05KRHoBTljT2Vt+wWENPPRGW+oHRJ+Q/ay7t/L8xe2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596990;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Cc:Subject:To:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bru1LDaNvB2UTo65n9FnU7w2CkYvIeNmT7XboTDOz3M=;
	b=HmGeF6B6WrL5TuAFVCr8iwy7auUpbmdNGqk1DZxo1ENPXtjFkOV/UnsslkEFGpPYUCht
	 AChTB81UeibgJ+FI00vXGQWk73Nskpt4Q7RWboFbXmMKnLtRPn8t33l7M/QTfLl1GBQxl
	 nH83gRfRQdyxZr0Gs048Xi6Q3XUZgETlLFmGCSpaJixdXft0tomV211Sb25YxDsxiv7s/
	 VOzpg6oltIOPuLRikcBVvrAYaZ+innWXZOotEifSB/rOM/J/UF2jgF8qbNQw5IHCRie+F
	 KMKZDyzc6XvdlIbH8nA/5uAtxFdqzWajV1gfzW7JHrsSEba7qVGPn9YmdEHDDJZn6IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=APAxXOZs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CgblMO4Z;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AD5606A321
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 08:56:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2AD5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=APAxXOZs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CgblMO4Z
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68i0T3142902
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 08:56:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bru1LDaNvB2UTo65n9FnU7w2CkYvIeNmT7XboTDOz3M=; b=APAxXOZsnkjimD/B
	RATBk1kAQcUJfGCipvlo07R+RhtVQYDT5YZwEqwwY1aJmLtzax4BengNs81DeGGF
	3fIHkwaYNGfmLaUHXuEG+cpLHRbCCt5G256QFmhvRFs2eLAYlhzD2T7kKlitg5uD
	dSdQLIYOzMZHppv3yCWL+cOw/rhqDU9/LyIyy+isfpr+iB3caFF7Rc6qY13/NWtt
	yWYEPHkXFsLWKkWvXDaKbUxZdFPABrUfGy2PlZg78rM+EpDQf9FvXa0lLPsljHnC
	sFdXKlCIveKIuCheQoNpf8roPSb8laEA6LQ+/I3MsCWHcBYezCnMHhDjXzHir9NW
	w/Tzxw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc29x1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 08:56:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f0329e57eeso52134735ad.3
        for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 00:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795596987; x=1796201787; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:cc:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bru1LDaNvB2UTo65n9FnU7w2CkYvIeNmT7XboTDOz3M=;
        b=CgblMO4ZxhU3G1q5gG+uPxXiJufmuYOwDr3MH802BHemvHWGl3uQDmwGiHuwD2HeA4
         A/Py/A5T9O2gxPR0Ljj1f9USL8jFRxbrMUU38rYpkYqiotPj/x+sUyJz7m0sRxyNwjuk
         NReFpCs4KB/5Nf0icuC9ncvDXP1BzXwNFeF4y7G52Sv5Uw6O+a1wBnu45rSrYJGDnFKP
         Y3qGFDlFKaFVkxahhDAh/8Ll3fRgdo0n1AtD+nRxHmNoBdG9XwUMUphMuk2ADVaLs1YK
         jOv1jDGPxQNOX6cClxwl8Tdz5tEfh7DWZCna360UOZ+W58jkaMu+oSIzjdpcSS+WWGoT
         cbLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596987; x=1796201787;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:cc:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bru1LDaNvB2UTo65n9FnU7w2CkYvIeNmT7XboTDOz3M=;
        b=a3eChQynLj9dbNtT9HD6rCQ4UnB8gWB1yuxMClQnTawK0ILcUDeuYLp8OhXmTbbwEd
         AJ+oUvs23RTnnIwS9hDU/35gNxJhhUIGEXPFZm6NIch2cyvSrly71/p35HGgsLGcqYRh
         Uq2RLqkBvf7KCHcany5lJS8lAEqgm9yCn+O544eaiJi5RWWKQGSqQ0zY8pVlatGrjGVu
         r10Ce9mkCo0Iyd5d9FrjP9KVe7kqFPuVs+GE3DMZ0mZmGCXJwZ5em42bS+9mFW2eYTpj
         xo2g7lZUbP7A/2PcC7b2+JMQ4auL6l+aIs5hCircNt3qd5AOaVh91Si8EWOyt07/JeSj
         mNcQ==
X-Forwarded-Encrypted: i=1; AL+hErFbKmxoCN41d9n9tXImamJQtLlW30Ag3akDAbv7Hwxh1hoKui/GShfP9X1rfOK4zs7ZPA5KFV93u95nv2u45w==@vger.kernel.org
X-Gm-Message-State: APuU4Z/NK6nqVCzge//WW9iV8jhrdRTHr7Mc/TMQ2ampO5wE7y9al2UA
	s8eM9XzAFqPidGpXFROjaC2TapqdC1FNpUhkdcETiFSIRn1MEemU1AcWvUaf1aVGP57Szu7r7tl
	LeGf1HwSk2Ph/X1KeVXF5vtytghnqafAUCMXDZCetmKl/BejNU3AVOILmaD7jNBh2qKiOKA==
X-Gm-Gg: AZFdTZcezp5y0SkVC3+XcGVRx92XNIteX+sM9SwYH0uiuSXJEqRmGnU1vZKSA7n+9XH
	8Ti+QnUtRl1vhGRZo/nfDLpt7g3JmuXz7jG/EAqnRhpc7vDsFHPzlDsU2kZZM4jqs5D/uycHEkF
	JAJeVtmL29vO1Bd/CGFyhb19kc6ox8NeTyJMLLCvaZklQKoJGUcveQR98EsucXMpkUKpuc7M066
	b/e7WgijdVbs/ywQ3TsmZPCDqc0Swy50UT/fUHyMSbRVte4T4775/CS4J2W/l3/4I9OGF/5ycqw
	IPLvDF6kwSgqhbRkJ3fOJkOiBY/z1uVISZVIm0Zr5IIbpgQY6TiY5pLyJcF0GvMRuUJUQAlLssc
	w3z1VsoWbir9l/qMq3e/IN3PP0e5XBgSAzXvQcZH7ce2Mw5cxCba5/KCvY1UUbssa8Gfshfy3QW
	W4/rxNfZ6eC7Snd6skkw==
X-Received: by 2002:a17:90b:3d50:b0:3b4:d312:8fb4 with SMTP id 98e67ed59e1d1-3b4d31292ebmr4856169a91.43.1795596987423;
        Wed, 25 Nov 2026 00:56:27 -0800 (PST)
X-Received: by 2002:a17:90b:3d50:b0:3b4:d312:8fb4 with SMTP id 98e67ed59e1d1-3b4d31292ebmr4856128a91.43.1795596986940;
        Wed, 25 Nov 2026 00:56:26 -0800 (PST)
Received: from [10.152.204.133] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4b3c71192sm10551052a91.5.2026.11.25.00.56.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 00:56:26 -0800 (PST)
Message-ID: <e019d2d7-de8d-44aa-8fdb-e6770938c409@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 14:26:20 +0530
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
Cc: karthikeyan.periyasamy@oss.qualcomm.com, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Carl Huang <quic_cjhuang@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
        Kalle Valo <kvalo@kernel.org>,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: drop decapped frames with a source
 other than the station
To: Julius Bairaktaris <julius@bairaktaris.de>,
        Jeff Johnson <jjohnson@kernel.org>
References: <20261122210809.2087836-1-julius@bairaktaris.de>
Content-Language: en-US
From: Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>
In-Reply-To: <20261122210809.2087836-1-julius@bairaktaris.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b06a2bc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=X1FsCwAd24jH_VNFHjUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: vJE6W_dUl5Yq_BNJ98ZDGwMkejj_q-4D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNSBTYWx0ZWRfXzNv6Jxg8SrKI
 93MP9PYpvDWkvvOhABt3eLxHRVGfoYlsedznKuwKfWUb9mNQigLArs3Ks5T7qK5Xsc2XzSQp5+p
 /6l5ZUytBUOdLZPaRSTsLW8eLeEcjKCfwfLpdKBzc7ltlAvjdktA4ARypPjBCFgKLjaKlJLi44Z
 zlqmDq45FidRi806WRYzjUTFchUR8KPqk4w6GuHEG0YJy+5qrj2I6WHdwD6v7pbu9uTjEsODF/I
 0FjYThujBY/HqDvmS4COYeMDCAuCsPcs3ReDA+MLU50+f+TEyvE6zNLy3WIrpWAzVh+dxeWNUsR
 +BfEES3xTFx6nZHHf/NL4Rpvzx6HkJ8vYnrohJYX004uLqyvRHzsU864QdU2SuyR4q2DmegrEDP
 Gy2WdldH+3xsAgDisp0Dc12UrorYuBIWfaUajVDH56513KPtmGUO+Nml0VG4UaJhA50IUD/T9BL
 0tHGZWtRD7yBiE3N5gA==
X-Proofpoint-ORIG-GUID: vJE6W_dUl5Yq_BNJ98ZDGwMkejj_q-4D
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNSBTYWx0ZWRfXzRTmcx73OqiX
 Bu8BXN5WmToOadi9vO6NJkUtyfMnQPI1usDofeM769Ss4Eqe11CejFWN8GAItQJ6+ex00sMDqdW
 ZAIpU3Mi8soGM8G7rRFe02b9qvGdoHk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1011 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250035



On 11/23/2026 2:38 AM, Julius Bairaktaris wrote:
> With Ethernet decap, ath12k hands mac80211 an MSDU with the Ethernet
> source the hardware took from the frame, which for an A-MSDU subframe
> is whatever its subframe header carries, and mac80211's 802.3 receive
> path takes it as the station's address. When mac80211 deaggregates an
> A-MSDU itself, ieee80211_amsdu_to_8023s() drops a subframe whose source
> is not the station on an access point; the decap path has no such
> check.
> 
> Drop such an MSDU on an AP for a station that does not use four
> addresses, as ath11k does. The address compared with is that of the
> ieee80211_sta, which for a multi-link station is its MLD address, the
> one mac80211 compares with too. A four-address MPDU from such a station
> passes: ath12k_dp_rx_h_undecap() hands it to mac80211 as an 802.11
> frame, from which mac80211 reports the station for dynamic WDS.
> 

Can you explain the test scenario ?
How the user trigger this issue ?

-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

