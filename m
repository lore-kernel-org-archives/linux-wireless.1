Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794260470;
	b=xpDEO30o7jYs+CQESxDyQKcHG6E69hhTe8RwjKVLYVmPM2ozEG4dwOUSto5mgNP+BAIp
	 O3DLtOM6OB8p9YJiUZ33wA9UI/Lm8iLMZDS2oYpQ5+/88gHDjrh1vzQvFUpRVDqSffAqi
	 iEFjfiKe+yRPhkeKeGHHKftMe+fJifARnVYQJ7CCfHJ+yCEXlhBsHSHJq7WPigevXzZsA
	 cMZgBA4Dm5n+vV58PdqhxqTeyHE9fDaDGgb5waKGsb8i94e1Zg+43CLhiN+A5U21F1aP9
	 rq0nF2RdE6bQwU4e0TcWZwZ5EVmxMYQ9eBmqCC9y4N2J9HsVg5BKaJ/8lwB7d28h5qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794260470;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=n1/qIPJBqOaK5hrWrCC708AJ+9Mblbc1lKyhpBJKBjU=;
	b=zXmyRUqzFWkKNHTuSJRRB6iqB/fbqxGEFr0C1FMXuhi7tYiaLEINe3S9PHOtnQ5d1Hwm
	 5dnOaGEIxxpytJRtp7bF8aY9dJGeh/vK2zhGd8SplN8nL0ylypDQSjj/YQJSDmJa4OIaN
	 uib79bCz+lWM7nvFm0r2r/1xb4+cgZL6C/n4L8cseT4h3MFqOCc2Em1eMwWOnz+J7R6XL
	 Z6YZMMtPjoJPtnlvaceDqc4IyDwUVDRcp+U+PgQd3jJawmjNDt7OTjt6cAgFeG/G6OucB
	 VjOzd/gs0xoJqtFADdnPPCs+Nhy3mrQOPabMkhTqnrx385/Ny+JHrHeCWP/6AchPxZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h0TEXYMy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eCy9xpuE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06A660A2601
	for <linux-wireless@vger.kernel.org>; Mon,  9 Nov 2026 21:41:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B06A660A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h0TEXYMy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eCy9xpuE
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9LA4a3870321
	for <linux-wireless@vger.kernel.org>; Mon, 9 Nov 2026 21:41:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n1/qIPJBqOaK5hrWrCC708AJ+9Mblbc1lKyhpBJKBjU=; b=h0TEXYMydbW0Ehte
	wQsHuEH89WnTTqkmrBY92fVuypuI7UbB5oN/FAaj03ZydZas0yPfsg4q+J/EB0FX
	NUhwuukqAlqBQxPwps8ck0Ofl7b++lbuLlDEA8XdJA3JK9qJgP5WShg1gfNsKhxZ
	SHfDmj8gz7xaPy75s9Fcd8LP3HXVBehfvmLWU2up/9umVQ96z9vTsVDd7TKK5MWv
	DQSvPHaXpFy0l/sWHvHfAa02YwqY+Nk5DjsFXID7si+E5uapYYXMHLtMUxmYxowl
	esg4HUiqFZqUPbUH8Loq3N83nNrC+5wiyXAgnF/EyB+lFU95DNo27EIvY9EVJiNE
	0M0p9w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hua58avvk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 21:41:09 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so3477022eec.1
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 13:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794260468; x=1794865268; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n1/qIPJBqOaK5hrWrCC708AJ+9Mblbc1lKyhpBJKBjU=;
        b=eCy9xpuE2C9CzWBxFXbZCeZEllCDfNUqZHKaeJoV2MZw5BIDd48ZyVpMpoLH7PiXUj
         K4V3sGE2SagUE4T+0vnx4rC+54PiypwilW4F0elyto2CWnQAJKxEHeXd/4JVSxAtqOIT
         4tKnBFIU6DE6Yl4I8tEzwCNsvvCKVN+Qj6kjQjE9LJBKZuuZQyEAw/E2cckZV8MvWkqn
         Nw+tPKUtdN6R70o3DOa1NIVtZ8tnGsV7jQqwGdaHxMDj5CK2iKQ9ZHNlFxS1DqKa2liR
         eg9gjxE6+Y7ip2FjOa6OnkMMCZISDT7cdJv33+Z8fis7FGIqX+XaTTeSGIJ2gvbvuPEf
         sp6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794260468; x=1794865268;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n1/qIPJBqOaK5hrWrCC708AJ+9Mblbc1lKyhpBJKBjU=;
        b=lLwbD3Dmpb2yK8zoGf4xBkWxD96R+mVUTEWww3WqzfGaYII2mnf66doJGMHYpIN7PK
         AmDrOiyHCZbaa1j4MNdMBv+CchXzZcVO5jee5UxLbvsJnQlpaPoPO+6AB+f5bfplpU0C
         +43neWxiGja1MImpxFy1gCA6vjN/qmFZxxlheWd9U6HJPnsOeiXMw0f5XrM+GKcpd+EJ
         /1dvyKiSHRiB0WDi5lRFZJei3l8ntC8+cZxUKu3C/ZKrnCqVDPQkpaPQtx7m8iTtcYpl
         DIFP2OwBxK/se9SR3P0f6p5MnGiTYE+d1SVT6A23UkEqhVROVcCq3NgcfTDmwzI3qNj5
         go5Q==
X-Gm-Message-State: APuU4Z+4TIi8/TK1arPwicrpAvZ7Ey+fyl+D7dIa4oC9oGq7ywnezCac
	r/GVOXQJjMBtSZk7LZilrYjJ0g2WqyL2LD1QGQXimc0sdazroOVtZ+7uixXKfC1gFj/6V23gSff
	riXU9w7Vm6X5TMpDDQmhxZLDL14mAPt9k1k7yFqPvQpn71DmhvsgLXEMAPXosJnBCtK2XUg==
X-Gm-Gg: AYBFou2LLquT8ts+H8dIVdHHNHiQqz5D1yWdR2Fy8Q1PTl+v+2iODqSVXy7VElvaUzn
	QUJBqSrW0J6XSc5FecBpuOfRMqvDMEj5b1qcauAC5sDNADYdOcqUD6Dmpd/62+H5+9v+oU9bHcs
	DJ8aUY5aKwRGEMHJdLAuuzh6M4gV1U9VZB+CNGcS0ap1j1XukIu4s1MyhR+G3Zw52ikqpsL5lBa
	/H/xeTHGFZOtK+kKyw4QN7ItAou8qbHMt0dgCi4Pvgd08F5S4BZZJxXS1+9X2UtQwk2NfI+/qkA
	Q7Voyd5usrRcr5KLljlKcLn9QyWxf7rO7ssfEnrpGZURX91r+yiVoZlUNIPVSYPt81RwDLNqPIA
	kq9DVHgQZAWe3s7y6yuJ1/GKgD3WwE3cyxrN1MCOp3fk0TsCDBRaVCURPpPPIt+XnEgjJbu1RNu
	umG/bqzNlBGN/UjmGX8YwlGgFldac=
X-Received: by 2002:a05:693c:6384:10b0:372:32a1:b384 with SMTP id 5a478bee46e88-3751fe32260mr745598eec.33.1794260468218;
        Mon, 09 Nov 2026 13:41:08 -0800 (PST)
X-Received: by 2002:a05:693c:6384:10b0:372:32a1:b384 with SMTP id 5a478bee46e88-3751fe32260mr745562eec.33.1794260467578;
        Mon, 09 Nov 2026 13:41:07 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520512ec1sm989985eec.12.2026.11.09.13.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 13:41:04 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Aishwarya R <aishwarya.r@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20261106111032.3157318-1-aishwarya.r@oss.qualcomm.com>
References: <20261106111032.3157318-1-aishwarya.r@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: remove duplicate ucast_ra_only
 assignment in dp_peer_create
Message-Id: <179426046400.3811579.5827170822859278967.b4-ty@b4>
Date: Mon, 09 Nov 2026 13:41:04 -0800
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
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4NiBTYWx0ZWRfX0DdePrf1wGd5
 WPy0Aqk6lW4EUviVQ0l9wv+darK/GY0zhR/h2IK9cGdui+wZdr6A9VBtCTBOmv3W0wb0R/rRrMe
 poR1Unl0mw1XWG5DpYnDRXjGKSoJZMKbboJd1bxK9xIU1XoazB4opSeYJFsdGR4Za7IlknCreqC
 oyNu70orbvmzjdqgUqd7hOCfaXbqtnvMN9e+dFf+yZCI1zevczggjrjx3EcgnS96fUMh3YzMrS/
 5FgVzAj1yKjvmoeIdqJ7uElOb2ODAWUqTBXsgPyXMBzq9QJEcbHz1TbBYzKBthgPkxEkPJ8uMUE
 QwppqO1GCYhi4AyeFZj5LbWlUsxFabemoKGgaZmfvdwnMWJ1UVqOAYwO12Rnc+I4grk8p2FjRyv
 UitSW4XLbyu4ZW1pacUvM0y23bSUZjYaWSim+hOh/vR8/hhP8FmVjiHIHLPN1EYQisR1k/AeQo4
 LNvz9/IybC+X0moBMkQ==
X-Proofpoint-ORIG-GUID: kdB9tz7BpF3PljMJpbXbZjp9XcUHzdx6
X-Proofpoint-GUID: kdB9tz7BpF3PljMJpbXbZjp9XcUHzdx6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4NiBTYWx0ZWRfX+oq2Rkm0qW6y
 Qxi86+3ea029KTRxVfGlLQb/8OMNveBIYT0pIw+DYFEtxSSV1nsmWXBOBX2N+NjsMYWthzTYDkv
 4pMr3O/zrDiisBF2bSMmxW/kDKOaabw=
X-Authority-Analysis: v=2.4 cv=C9V8WgP+ c=1 sm=1 tr=0 ts=6af23df5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=oua-9Svr7Zi5yvPhmTIA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090086


On Fri, 06 Nov 2026 16:40:32 +0530, Aishwarya R wrote:
> dp_peer->ucast_ra_only is assigned twice from params->ucast_ra_only
> in ath12k_dp_peer_create(). Remove the redundant second assignment.
> 
> No functional change.

Applied, thanks!

[1/1] wifi: ath12k: remove duplicate ucast_ra_only assignment in dp_peer_create
      commit: d0fbb39d65dc9dcb4175fa6b23e473dec3670f4d

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

