Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447940;
	b=zQ5tuRP39werrpQ0OR4hzm7SdqfcT0vXp1DhqCuCrUHwkfPhqrd+7eak+W9TefbAeSkZ
	 s5Ftr1RHDPce4mmQOb2BiznsXrZCkzhIKv7j3nKEPAICxOYg9A4VXqGMmF3/4CA0i+tTV
	 G5lh5nMXa5RSrMmVUJ2luBPzAFCAzfLd4FDhBfsE1BFGzxpkhUl5HWjBux8v8eq4G9oMo
	 SxvMR69g5f5tzdeXVePOnmlmJOP+2hsgj/VxVnROIZdTF48WUTrRWLJgzBfG6qQGP9H/g
	 NqG3+mbcHJHL3VIJIYoqiM+kKmDZdQYUBEZIQqJ6Ieit5TfrOsEH7UqhjAv5EhhMtkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447940;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+cg+HLLf1GgThk3qa/fLNtMDnlxrXIqtYEA8DMiby0g=;
	b=fMuIp+ouYOei5V9EkZBjzROAuGA8ZjdawHL302BY2sbN+/+IHZZRtsbWzbclQ48dwaIr
	 rAUv8qnELUxYomrrjZvwgMDt2DMbn/tJZ7JBvevqVvsHcXx7pyEKuBd2jpOO2NzHJNlqt
	 ZdRVkHBwEvlR9FXg6T4m33asSYk2fXVatbTww77ItK/BovMpElB0e2ogolYx5LlIfjrBw
	 omko5HpkN6wNA3EeJrY2xXKYCWPfkYirN0+FZyEJX5kdchvheYAij1qN/jyLCKtQboAXe
	 VGQUaqcGCyypQTG/hWUTeeTcvXuF1j8GL/qGtlGUPoHuTn3PCuoIIxcdUWbqmu761hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XNi3fIG8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MTYpjMD2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379A1606A338
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 15:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 379A1606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XNi3fIG8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MTYpjMD2
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKpaV2368956
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 15:32:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+cg+HLLf1GgThk3qa/fLNtMDnlxrXIqtYEA8DMiby0g=; b=XNi3fIG8bLeWMU+f
	PwdUtzFy62pJN3m/uGsa6NfdR7ouMm5LiYtfaTNBKNdEfLs2s6R1cStk/RtofF4x
	SxsjBrl8EMJQUyf9IbdVp1Kkf3Ov/9iMVU+qYILRHQ80s/FTqKbeAsCdcCIifPYm
	qQguOivaL4NEWgFe/ZZDj9CPwEVNJVVlZIKbYGV5HOdLSWGOnNn4ayu09OWHKM5A
	pLK2Rue2VTs11R8os2eWmHiavQxvSD1MSHOLPNMkcUdndOq3w/AVWm/RhpR3RtwE
	1hpChhkUrek4n3LkgToNrUj3GFMofKy2/YGBck3DD8J/sT2qDTMkRM36+YjhmM+J
	t2o3Vg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pa28e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 15:32:19 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c58d35c0aso466278eec.0
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 07:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795447939; x=1796052739; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+cg+HLLf1GgThk3qa/fLNtMDnlxrXIqtYEA8DMiby0g=;
        b=MTYpjMD2QQBERPaZLcFvcdi3HK+YRFTwD9VXKk/QbPGtMqSoqvh9xHYlFJw9y+SYgD
         +eIr+FTPq9bnLRWRc6pV6F31+MBgbxhw/abckQ1JNU7oQPCaDfD/8McVVN55NXs7U+aX
         NZdNCZo0kobdV2WtjPMtE3HpBVwr9c3C0IbKXCIW4XVd8spmxk/f1Sh1egVhReB287Cj
         eXBQ8usEWhZ0Ic3avurBUPlt3g87pBe0pImO445Hp4gGCMlD+d7ifyH9sHxNSGx43SvK
         bsHxZkcoUURDDoG/Po/jZixHSThhYGzDc6MRKLBP3eTkFiCrnMXds0Uc83HM3ojtOHA6
         oR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447939; x=1796052739;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+cg+HLLf1GgThk3qa/fLNtMDnlxrXIqtYEA8DMiby0g=;
        b=lJiNGescrottEAcWJq7kx7I7yQvZjkdUCl2w8iF7x41capHo09v0CYXgEtB7vSljzB
         POtgMJtkgQevc5cFhIJUUgrJK9nWGf3/wcXn0pMXSJA5wRGjkl9FLD1RcN5o/dvADsT2
         4/P7pS/fniIIcrAMJ851skXUGfVfVYXveSoFSJHuqCpbTtHS1pnXRtcuZyouDX5MogRS
         2q4TaeOzOa8bH4/Dw7nG5aQD0LAA3nLu98kXZ15s8oOIHdKiuX+dshIor5Hnavljzvsf
         3nzb6NKGqvd1NmZ1YdRBfD+ubHpR3Lz3IbNmoQdvx2ifKJgzVpGzfoM36diBNg36GOlZ
         jbJw==
X-Forwarded-Encrypted: i=1; AL+hErFWGcnXWQf8JLM7ROqgXddIQCf8SUNXwoaZonjqW1su49a8VeVzGIYgaGQd6bDG9ab8L0O7Tc1Mjc7k/+5AjQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+/LLt/BuIpvv/x62qZ1ALzskwAgWnt4nryJVKUom+WCCxCRZMH
	3/EzvCZIyLl699rEEgMLDHgjs3D9h8jO1kY/q5AgN6w5pw+JZszdi722cGMdY8ishR/thNkr5uJ
	wPulHaAdgeODjxMpq9ZCnqhIITjTP9rEtmP65++ZDneOCrYt9hsdcAQygaD2aZZKoSTQsLw==
X-Gm-Gg: AZFdTZeogCkrQDx3huhzKuZ6uMe0fMuKSSpogSQB373kpB6nOiOuiVppnro6wudJipb
	rAhkorT3txhb7cEXFzOhzwxDzcCWYqMJSiyIist4iIH8WmWmUpT2cfjKqKQI59jKZqp2w/pyUg9
	KZqdGtYn8Ayy1Srx8XYvCDn4XcGHhXNSAaauxe7aceG0plsUpObjaMU1FfRsiMDvoi+JGlwPoML
	ugxE0jMigqB+tWzqYrBrG5iF9htVqlcQSqI9mrDpj+afMW6A2Js9umv/WaejscXE+puwFd+JYqB
	Tlv8UwaPtE7737Vc1wpKgp8rbDDgZb5WQYEIf90KT609OXSAYZeZRp7YG7xS+EvF5DGXZvz2VOW
	qz1hllk9m0P/IKEm/JoSC37x/GdddcxNfk4EChAAzGPfll2nSNmsUtubIcye9/2wzbsx/iX8=
X-Received: by 2002:a05:7300:6025:b0:384:cea9:a109 with SMTP id 5a478bee46e88-3856925debfmr19458786eec.0.1795447938637;
        Mon, 23 Nov 2026 07:32:18 -0800 (PST)
X-Received: by 2002:a05:7300:6025:b0:384:cea9:a109 with SMTP id 5a478bee46e88-3856925debfmr19458731eec.0.1795447938084;
        Mon, 23 Nov 2026 07:32:18 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cbb80sm5516406a12.9.2026.11.23.07.32.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:32:17 -0800 (PST)
Message-ID: <b777e26d-98a1-4cef-96f6-cdab7918a1cc@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:32:13 +0100
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
Subject: Re: [PATCH v6 6/7] wifi: ath12k: Add support for MHI bandwidth
 scaling
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com
References: <20261119-bwscale-v6-0-9a9a715fcb46@oss.qualcomm.com>
 <20261119-bwscale-v6-6-9a9a715fcb46@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261119-bwscale-v6-6-9a9a715fcb46@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX7tQMtA3e+9h3
 1B840bhJ0VaIhKVVMizlVrLwNIb2swEwWrAgamkpa6WUMqZfSHM+Z36a4MHbumioE4GsiTBqEJ7
 jDScU9VQ04RIikRlh09t3/JgscU+Tp5hNQkdm3a8tbguhFPOpciCtlFVBiqVtKdhiz9+dFOzj/F
 us7xiRy6fO+gHSQVRqEng517T6kAxmhifg7yj6ky6obt7rd4pxW3lv2Xov+mO5j8DWVhjtHO0o2
 Mx+M608OwwNqclGhu4W/7uI8EIMWosknmoMQbjUvcUQz/9L15B/923cqe+RVb/pTosgMGHo4dbd
 GqH1JWC/5SIXeVOlRIcRTbMKPbf0hhmz8bmxxuu5qjLBm27FL2wCL5AZnxXrSTpeQAL0QUIaR8F
 BeAXrK93nRTQn3okIn6/HvNHTLIkQnsqKmqJSj34oG7DQaw0OcZadk+JgMxWVv5szsLBaoVSvGh
 4CYQ9FNJ4F8rPA+yrDA==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b045c83 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EZJCw1MXRrN0MplZF-sA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: CWKkrbiv1i6NfSv-8gmrg7nQKT42_8jp
X-Proofpoint-ORIG-GUID: CWKkrbiv1i6NfSv-8gmrg7nQKT42_8jp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX1DfGk94vpzNv
 FE0Jd1GHvTKUY9uBfuef37mQHtLpLrguZdCLVu9i4SAuZaICbgrIH5p8AnfB38MLjkDT7sb6iEN
 oRXUYf2r0UxZ31edVZbJiSmD9gOU+fY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230061

On 11/19/26 1:56 PM, Krishna Chaitanya Chundru wrote:
> Add support for MHI bandwidth scaling, which reduces power consumption
> if WLAN operates with lower bandwidth. This is only enabled for WCN7850.

Curiosity, not necessarily a blocker - do other ath12k chips also support
it?

Konrad
