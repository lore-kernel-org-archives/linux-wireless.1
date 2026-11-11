Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794441555;
	b=uvNArGlZszZfFPS9G4n1xuYpyPbB7ordkQMNcj7BAPvhyRkXqROk3HTrO+4tqnk9Cv6g
	 gT0xrly88FM9aR7jOjc+ClkkhrrnmkCQO40zLPRJ8KvpjCfUSM9zA3aIWzxfJ/CdY5KAE
	 xJkGimMkA6JhVIQPT3tjRvsQ/5ebLRm+GFCc0JQ2F8SWOy0vGgy5OtlDrhLK6z0JTGZmR
	 9UGaSqUUU9qhCdjte0vWqAZDAC+2KhWBg9SNuFXHQBZhp/tOC004ub2qtuvZ85I3soQA9
	 +9yCIpon0x6gw8AzA6/lkxxkPDzyYZlPYoXe3wxAqNKtqkKbqfuitDtqOkC5eOk64uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794441555;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=BI8HS9AREBj8Zs2KSOsW86Cb8XsVKb6uk4HE5n8nZVE=;
	b=ujYZeDu/mTvGGM5hzKT9hOI3PkNHl3CoXpNYNGkwjlnrtgsT0aUKWo+LcBwxk4z3OT8T
	 5wOuubVam346OTtmRqiMIK6iWp83+6pdFaREAgV8bUHatGyZ0GlON1mkC2jMXGDVricEh
	 z0JXG5PLS32m7oGUB1YVTkdjf7XPhduFh3ly8X7KuZ1oiMWdIQQCF2I9uxMBz1DkP+TuN
	 UmMIG92UdLHg9yNNk8Ox9LGFsoef+AQtWDcaIePWUvHuZf12G7HDadusvfjdIwZWpkKFT
	 NBUqxydur8QioFx29LY94okEp2MYiHjrwlPQFN2iWyajmPiahWSC+o9Kb3ozFNpDeZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pR2go8KS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aB60+YCH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF226606A321
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 23:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF226606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pR2go8KS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aB60+YCH
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABMaMmC3703767
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 23:59:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BI8HS9AREBj8Zs2KSOsW86Cb8XsVKb6uk4HE5n8nZVE=; b=pR2go8KSTWSrFOsn
	sdDzpW4cDZoe9sWhRxJ93Cz7JNd0UBGPyP75iL8+OhN7j8PgMzIzfnGI+7Eqo/Pu
	Re72uPGXVvY1DbKbToj0ISrvYaax+D+sfiFYB0Po+N+rBu+nDiWRADx5K5wgFg5t
	zN9misA1jp+dV++v2S4F5KKh3aQwQkHMnAhZerbM1Xkq7B2uNlErdGv/m0YaM6Lj
	i3xIfEAdevHA89t9rYf2Zt4rQmnpMIS/fLggw6e2bS0OAfQ+dHH2L8hvQb2SWQ+e
	xbF3zxIhmGwS9rSMRsNzEdORsjKmOB1OOT9bJROWNxOcc6XJk73JL7HRJp0giq6m
	Le4LhQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdmeen-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 23:59:13 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1383723dfddso5327192c88.0
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 15:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794441553; x=1795046353; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BI8HS9AREBj8Zs2KSOsW86Cb8XsVKb6uk4HE5n8nZVE=;
        b=aB60+YCHlSDdn49rVTbmRzIQDxMct9zcbv/1juTipeAhSLOrv2uch4xm0HaZu/FqNp
         qNkOCdiS99A6akOJu6UsfpXc9k16g/eiCp0IaAtJreZ7PsMPD0BFXWN9HylpKnG5+mtD
         TgwJ/+cKSRDCnCe84Gye71eJbN2N1gP75RNKVt53uMxOyM6En0VOY76CX8uw1w6tXeG8
         bh84OVkSxUWv2T/Dxf7bhi7o3WLDXPitP0OuKNYokegwPF1F5koJe1ampg7hAQLE7PUd
         3Rq38UVh6FzyvNn+kn966Rnik632CL8fyaNCQXYgcwbGQqR9t9FNuQ5NZGD0Z5dg7Gic
         6lgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794441553; x=1795046353;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BI8HS9AREBj8Zs2KSOsW86Cb8XsVKb6uk4HE5n8nZVE=;
        b=xNvfGMDF9rSpfL4VbHt2oRxt/MiuQ41aXIgj0FKddFqGbuQBvbk19JSYaAxSFn4I+t
         fTlDk4MxHC26l21ukzO9A7p7lJ/Kjigx5d3GrtJaaBC81UKKLjFsCd6EWkQE+0juwJQi
         RXoEorWxFMhVBOjtOZ0iZUImnBXTRiKZXR5wDMtf7UwChO8UczSIswmuyUfgdc8O65HL
         dqeEvKgt9dRbhP24d92G/RUvC7OtEw7vVsKNJzymAh3TCn0M96I3P0iKIQwaroFvoF8m
         NCc1E+UUkWnnr9AX5p2So5qUXHwUXaHvy/37IrsKQ69KXs4BGKeKuoYC4d9OWtSuZdDR
         PtKQ==
X-Gm-Message-State: APuU4Z9Qzn5abniCa3s3haMVLRm/9WL/nbHR6Evpu2l9z5V8F51CLg76
	XEoOnINhL456XJKUIy4Ii7SmxB8s+W1wYS4RQIkJpvCRgPSVgX6WZGO3UT+jl0Zovjk55t//COy
	+iCSVXsLz8OK7dXmZU3NfRBIjcb9iikIh3D22RigqQar7jg6OrWS/zvh6IM32NxrjwK36Fg==
X-Gm-Gg: AYBFou3gOzIFa2KRX5J1n5JrONnui155q1mtHxjsGOQkFq1lIz7UYYsxu9G1/xlKP9o
	ZaTfND76my8NqPx46H/E0WHcHkb3PinN8qZQHT4MPkKpVNOtwx2fyVJeaBEPZ5BcsndWl7RX4Wx
	VhuDtSX/i81Ivca5S5XMPIKYCA1gUTdlgD9tGyBvGnIEFkCP4M/yQ1fipQU/x2Qu0E5E7oTKdZy
	nmpDAK1yq4JLYd45LAprW2LL0EYoaZp4nu5S1h3MZPwF0bxVvjm7z9FhLXPoML8OfjecPv+jg2e
	GXlgzvII1PqT2h2Y47IelSlCJOE6f1fdQamOa1gEBflRnLUkFyy+auvLGidHG1eVwwN0rjvu7kq
	xW5qcRpqcLTCSfBJceM1ro7FVKZokftk7wo9TTfcd80QNmGx2lXk5bSp6LBV01R6bFkqJ7PoQuu
	sys5yl+Zdt7Bt+YoPjJGmHCJnaeh8o
X-Received: by 2002:a05:7022:eac9:b0:1b2:43b0:4794 with SMTP id a92af1059eb24-1b3c02fbcc9mr4282402c88.9.1794441552984;
        Wed, 11 Nov 2026 15:59:12 -0800 (PST)
X-Received: by 2002:a05:7022:eac9:b0:1b2:43b0:4794 with SMTP id a92af1059eb24-1b3c02fbcc9mr4282374c88.9.1794441552287;
        Wed, 11 Nov 2026 15:59:12 -0800 (PST)
Received: from [192.168.1.20] (39.sub-97-215-59.myvzw.com. [97.215.59.39])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4efc2sm16960422c88.15.2026.11.11.15.59.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 15:59:11 -0800 (PST)
Message-ID: <d5f3296f-6ee3-444b-8310-3912ecfd1c8b@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 15:59:10 -0800
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
Subject: Re: [PATCH ath-next] wifi: ath11k: require unique station addresses
 per radio
To: Patrick Lawler <patricktlawler@gmail.com>, jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
References: <20261001164139.370144-1-patricktlawler@gmail.com>
 <20261111223509.283556-1-patricktlawler@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261111223509.283556-1-patricktlawler@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af50152 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=7UwXyAtrHAWG9Tdc5CO1EQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=DliMxTWXI1x5dq_kkzkA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: u8r0t0QpKgaH0G4PXSFpumBLFAoGJIWN
X-Proofpoint-GUID: u8r0t0QpKgaH0G4PXSFpumBLFAoGJIWN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA5NSBTYWx0ZWRfX6xYStTMUwVrD
 NCjd2WGdw5dStuv2ZbCFvl9hotJxpINBg3/kmh+wIlQpSrXSMCGFdvh6EeO3rBVtqp+NepewSpp
 dIn/hfQ4BYx1QM1vLuWfkev59HaJDvEVQYmg7vTLeEcRI8+4oTH2bTVVkf4SB3nmW7tz95B6fZw
 QR6bv8prUl/oMDCqsVwg1R13t8qvPGx407k6R/8Dwvl+MpepYETM9vqkzgWitKcLIP7DlnxkcZZ
 aR8CDzzpKMDiJpBxyPHRG5llXQEiMsvGpuhz6w7NKD2n0S3ag2yr8dJphsEaCc6fM0abeXraI18
 O8EKbRuQOF84/HzmL1rT4AmHdxQThNm6J425K+JYsFhr6ABe/a7ZSIP1gn46y5d6Hsg8OFQJjEG
 bbnpXa3GHl8NgezbapSsU4ZjDFYOwEoFUWAi1Rr3Ke8/dA9EmLXrc0lUkiGlUHxVf3TuMPzYv5w
 q3LkMzxnAgveOYncK2Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA5NSBTYWx0ZWRfX12/BZHKD4e/V
 93JvpMkoDQTPIIsD2OdnRXqugVSOl0BFSCC2Wj9wf3+G2WwO/HsCdZ6Dmvlsy8U94RJHcASdPJU
 oh8Pnz32T0pvJXGPbell26qMuwSw5cY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110095

On 11/11/2026 2:35 PM, Patrick Lawler wrote:
> Hi Jeff,
> 
> Gentle ping on this one. It still applies to the current ath-next.
> 
> If you would rather have the driver-side check from 1e744bf218b5
> instead of the mac80211 flag, I can send that as a v2.
> 
> Thanks,
> Patrick

I have 400+ patches in my queue and I'm currently focused on ath12k Wi-Fi 7
and Wi-Fi 8 support (both internal to Qualcomm and in public) along with
critical security & stability bug fixes impacting upstream.

I have no bandwidth to look at OpenWrt forward ports at the current time.

/jeff


