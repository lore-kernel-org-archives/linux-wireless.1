Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794166022;
	b=M6DJJNd+GW1SSmp9XdmmhfHyqLeulb2pUXdM9Lud58v+4srikjxfzSZcR7TK2FPr8TnA
	 dg4cHePQdB7giWx9lfmKD+mnM45jNIk3AlMua2P1Dh+40Cu/jrYE/DbNP/u4/LtdW9JCO
	 vlFtIXdGpdEDouPpZ2h/r7SRUoImr/o9XAod003wu+Xp9K0KXM55AmsM+mkftjlIDckrp
	 WeeVPZU+hsn3089+wAS9hSiKxoZTGR36+xC5bpiCkTQO5Xp3LIzLU9QuUo9bbhkTyfXR0
	 a7oY4HDvG7QIrd3JvYrUNCAVzkRYqnP5yU268CWkfvFzb7wTIls2mDA9r8UTPLr/lFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794166022;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7MvBQP+RPZdO+4zBMMId3NGJk0bGAwDV70faNQFbJgk=;
	b=QIFZk5peiSYF6knej+HaTnDv1M6ULMG7vXyWL0ZxUpx+BuAqYj91p2qbwMEg9mlEQPGO
	 K1QCeN1PiqZk8wNvoFaolZ8rZySCc4a1XIo4HAq+7Kt13hoLt6Bd/EJvB9jjzbDvvKb/T
	 8CC0XpQK6K7KBZ5oicnQkxNia2qNYZ4VWd0Oo+PPsUgS0dJKeBEGstCbJWz+GmtwL2Nhe
	 07iiXO3HppwJYwW/qisgFD9GKYpSdNh6tsGSAoN+YApsYUrX4F0Hbh2gufif5vioZ1xR5
	 GZd57rhi5Gnx53nz89A09fRUtQcAVUeWgUNqS9y+K4Kc42BsqPLgZc2jXltzMrkfqCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KuTifvIt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UxZ+ridf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E5D606A31C
	for <linux-wireless@vger.kernel.org>; Sun,  8 Nov 2026 19:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51E5D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KuTifvIt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UxZ+ridf
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A8Hog8i2062051
	for <linux-wireless@vger.kernel.org>; Sun, 8 Nov 2026 19:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7MvBQP+RPZdO+4zBMMId3NGJ
	k0bGAwDV70faNQFbJgk=; b=KuTifvIt+hAvDbSgw5axZJvcmoRBKIUc/PerbkO9
	CmkL/TA6swytHKf46WKJMBbDU1lRtwJIRp6AyxKWIdqOhDs3QXyWzJA9BPvaMzcl
	EPt+JCd8H/mqtat+oefZ5TYi/5fcwfHWbs52Lg6gvy2aO9nJ6eS5maPb/F9oj7kJ
	gM2h7WHX42jT0Btp3Q+YIIOUu2s7igG7L+agXPGwEdIzcw3cBUUfivO+BQXcCmC6
	/o3kxH2szS3kRAEIeb3DSlnUBv43UQbKauyBMQOVs9TBFSGwuMEyyF5LJ74Q8gTV
	VLwdS0hRLKsWU/9BLuwUbpqnK8/yhgNvWd5WY6GYfIGXmQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsv733g8k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Sun, 08 Nov 2026 19:27:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f13c143c8so41355085a.3
        for <linux-wireless@vger.kernel.org>; Sun, 08 Nov 2026 11:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794166020; x=1794770820; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7MvBQP+RPZdO+4zBMMId3NGJk0bGAwDV70faNQFbJgk=;
        b=UxZ+ridfyGb4xROmFsOSI6bI/giVmSLWFSnXxrlcm1ALYKUdwG1p+VJmr7oOkJL4D9
         xlRqtJOR03tlwf+nYBFm2Od8Qi/l9YyNXGR+PgKY56uGjdKVnImOXSUsP4p5qOZooqJO
         aENImuVdmCIbl9h70Be7Y6is8FqUDZuo8Jd3h7+rX7bucnhql2tGmQQ9thaRPnCu6Xtr
         93kpNASHu38gtqofxTZELCIFsJ/KyFHxZH33dOB0cc72jO49dWxE8O182AsLSain8F89
         MmLjYus6rxB1d4ni3bNK85vks1fi7+JjcgoCSxLqa1c3EGuusJEHSdQ+LUxpTve4iXUs
         bjiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794166020; x=1794770820;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7MvBQP+RPZdO+4zBMMId3NGJk0bGAwDV70faNQFbJgk=;
        b=aSXN2UBgScymEKXjOayJEoqEiMmLk+V+KfTXbFaAs+5usvFjRTjjglLaRCP+CrSH6q
         LNuH8Cdjau5XSOKWWvGHfFvTRMhsA+ZoAt/hJBv1IoBtkna+WqauKti3QM3zdPyM2d0B
         vWYbc7v1FeMzRiKvpFWWOcgldEW/iHVRvqTEz64IJOtlWw8YOMPEdKHayGmPINq4HqEN
         yDXfLQYYPG8Gq2o7rv8jhZTozenoUhzTb2bKwBNdMLkGc0kNVJZacz2fOjQLsfic/o/W
         LHCFzULoskLY3xcvfQtCb7XkSjySx98XVtvLk9oa1/DkcUvJRfPBb/MnBVS7xMJdYQuN
         g90A==
X-Forwarded-Encrypted: i=1; AL+hErHiIeBuCyIRaFTq5R+Hvd5fW4BDWSqtTqFutJPueRAOUP59vjm723Rd97x0jLJyhbwuWQtRiRH/qAMBzKLPxg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9T28OLXRVMdSoV7PlhDa8CvIA021xdDxY/Dwb+Fo7w+HaXkpD1
	XCS4Dn3fmlnwNJty5HkE5XuYUZe3yWaqECpxpPCH5vhs6lTkYA6sB9B6r8bwX0IJwurG16HFJmE
	H91nFfW9nHP1V0dvHmtVj25IUZRiX1HsrjlCllMgKEB8pcuefw14HvUYoEI/FJZUw3i9o9iyRRG
	NKVQ==
X-Gm-Gg: AYBFou2i/tXTX+ng0Xzi5EnfyiNja4/XpfScBlB7k11cZWFH1OP69GsAAYmetlkuRGT
	TxA0j3zWPnzQwTn/hI2U5MYHou43CvVM+BnZeK1SCVTlN8P8TeksAlXkcdcOFYh9FPc23AO/fxW
	53S4GvtgaBKduky+HFlob8AM52G2fx4CEbxeBUKu8+4sdoNXryzeboN2v1/94//n8lfnsWpPquL
	3SC+wchllWaOUY/2u/iypXlxd0lY8Zu8c3NcpD98v6/KcUV6VVROQVO8G5JWzlHkKWYs7Txp5cw
	fZr2zE+sy4XCBNJBHbY7r9iGROboNE7coOeFQHGwe+FHcbQOBqVj/UuZdAcCB/y5utRYx8Uvz5Y
	pHUppC1KzGxN62/ebQbJ8lGX6PW+m9d0141RGoEoiG6V1QrjCn7znjcIS4RIUiDh0mLcn2u16V5
	dHmKaPYeJmKBv9OEzAX0rtu8oT7pFshX8ZfQn1ZtOLeJiN0WCu2h3efjdDKOcf
X-Received: by 2002:a05:620a:2911:b0:93f:38c7:70f9 with SMTP id af79cd13be357-947841e8384mr330880485a.14.1794166020383;
        Sun, 08 Nov 2026 11:27:00 -0800 (PST)
X-Received: by 2002:a05:620a:2911:b0:93f:38c7:70f9 with SMTP id af79cd13be357-947841e8384mr330878185a.14.1794166019915;
        Sun, 08 Nov 2026 11:26:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3adf9e0f50dsm5053111fa.16.2026.11.08.11.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 11:26:58 -0800 (PST)
Date: Sun, 8 Nov 2026 21:26:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>
Cc: Josh Boyer <jwboyer@kernel.org>,
        Linux Wireless <linux-wireless@vger.kernel.org>,
        "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
        "Yang, You-Sheng" <vicamo.yang@canonical.com>,
        "Hutchings, Ben" <ben@decadent.org.uk>,
        "kyle@infradead.org" <kyle@infradead.org>,
        "Damary, Guy" <guy.damary@intel.com>,
        "Dreyfuss, Haim" <haim.dreyfuss@intel.com>
Subject: Re: pull request: iwlwifi firmware update 2026-11-08
Message-ID: <towutnuzzi5hyivntvtiziegrsnxgqvotaqzlhe23qvmuuvifo@5jlrsmfb4tuy>
References: <IA3PR11MB721313297E7927E041F027412AA3742@IA3PR11MB721313.namprd11.prod.outlook.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA3PR11MB721313297E7927E041F027412AA3742@IA3PR11MB721313.namprd11.prod.outlook.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDA3NyBTYWx0ZWRfX17xQiMprSKpP
 8Ni3rdWXg4Vhxxur5Nm4D89sT3lJFPdi7W6YKT/QO/LgSp+OzXA3UFJtdQjA25AdK43s4QYkp2p
 7RaabaCUbyZX/D2DpuyFGxqhNBkXQsMdQdSmY7udUJi3HcvIjzi+BHwcPK9xXVHX/rwbtpAfgec
 Xkx5CMiRLmVP/nEcJDWu+gKDhLcurtukSdrvk9wJ/gJtpqMvblsolC2jYOfkixOqfNKmnevTUYK
 dojJH4p6vDENjs2X5D+w2I8cxHHiBKsrft+l8ycJEWljkf5lGIX/NHuyhXdrqPoOM6ujT2HKssV
 AH51qIUwZp9Vc6JKbPAQ2cDqPgQSo1hTFToA6um05bhw1T7kxFuWHYBEHAYYos+tMYy3S2XA4WN
 ia/nV4e041JFQk+nChm26eUc1/eO0eBWGjcouu+WYV8RqLK0uZBNMHQVSrIkzzSSI8HGT8LQVlV
 NwoIMhsO/5hUxHDpCyQ==
X-Proofpoint-ORIG-GUID: _EliwvKZwj2RR6GQKUwqCyfWOw1zkqXg
X-Authority-Analysis: v=2.4 cv=bcb+w+PB c=1 sm=1 tr=0 ts=6af0cd05 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=p0WdMEafAAAA:8
 a=VwQbUJbxAAAA:8 a=7v8lMnSnM1fuFDcAtwwA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDA3NyBTYWx0ZWRfX4IhUlg8z+ihs
 YQkQqlab2jBQwsjMen3SJPdsrV1oNDJxZYpWG5L5mOyrl6fRWoF4ea+YVSvH0tZr6QYbaNyKQdj
 7kvsuT80uikA17bWtMmB5fzgFpgHaaM=
X-Proofpoint-GUID: _EliwvKZwj2RR6GQKUwqCyfWOw1zkqXg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080077

On Sun, Nov 08, 2026 at 05:28:02PM +0000, Korenblit, Miriam Rachel wrote:
> Hi,
> 
> This contains firmwares for core 24.90
> 
> Please pull or let me know if there are any issues.

Thanks ,merged and pushed out:
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1370

> 
> Thanks,
> Miri
> ---
> 
> The following changes since commit 6d6bffb1d85a1fe077f26853edce482f6c112f2b:
> 
>   Merge branch 'amd-pmf-1ah-m80h-ta' into 'main' (2026-11-06 17:58:46 +0000)
> 
> are available in the Git repository at:
> 
>   http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.git tags/iwlwifi-fw-2026-11-08
> 
> for you to fetch changes up to 8a672ff527bc3bf7c3797c3cce50fde17b4e3c00:
> 
>   iwlwifi: add Bz/Sc FW for core24.90-60 release (2026-11-08 19:21:17 +0200)
> 
> ----------------------------------------------------------------
> iwlwifi: release core24.90
> 
> ----------------------------------------------------------------
> Miri Korenblit (5):
>       iwlwifi: Add cc/Qu/QuZ firmwares for core24.90-60 release
>       iwlwifi: update ty/So/Ma firmwares for core24.90-60 release
>       iwlwifi: Add Hr/Gf firmware for core24.90-60 release
>       iwlwifi: Add Bz/Fm firmware for core24.90-60 release
>       iwlwifi: add Bz/Sc FW for core24.90-60 release
> 
>  WHENCE                                        |  58 +++++++++++++++++---------
>  intel/iwlwifi/iwlwifi-Qu-b0-hr-b0-77.ucode    | Bin 1406576 -> 1406576 bytes
>  intel/iwlwifi/iwlwifi-Qu-b0-jf-b0-77.ucode    | Bin 1323296 -> 1323296 bytes
>  intel/iwlwifi/iwlwifi-Qu-c0-hr-b0-77.ucode    | Bin 1406592 -> 1406592 bytes
>  intel/iwlwifi/iwlwifi-Qu-c0-jf-b0-77.ucode    | Bin 1323312 -> 1323312 bytes
>  intel/iwlwifi/iwlwifi-QuZ-a0-hr-b0-77.ucode   | Bin 1406720 -> 1406720 bytes
>  intel/iwlwifi/iwlwifi-QuZ-a0-jf-b0-77.ucode   | Bin 1323320 -> 1323380 bytes
>  intel/iwlwifi/iwlwifi-bz-b0-fm-c0-c107.ucode  | Bin 2163752 -> 2164040 bytes
>  intel/iwlwifi/iwlwifi-bz-b0-gf-a0-100.ucode   | Bin 1837584 -> 1837560 bytes
>  intel/iwlwifi/iwlwifi-bz-b0-hr-b0-100.ucode   | Bin 1584768 -> 1584768 bytes
>  intel/iwlwifi/iwlwifi-bz-b0-wh-b0-c109.ucode  | Bin 0 -> 2042284 bytes
>  intel/iwlwifi/iwlwifi-cc-a0-77.ucode          | Bin 1368100 -> 1368100 bytes
>  intel/iwlwifi/iwlwifi-gl-c0-fm-c0-c109.ucode  | Bin 0 -> 2079912 bytes
>  intel/iwlwifi/iwlwifi-ma-b0-gf-a0-89.ucode    | Bin 1752976 -> 1753076 bytes
>  intel/iwlwifi/iwlwifi-ma-b0-gf-a0.pnvm        | Bin 55072 -> 55072 bytes
>  intel/iwlwifi/iwlwifi-ma-b0-gf4-a0-89.ucode   | Bin 1605016 -> 1605116 bytes
>  intel/iwlwifi/iwlwifi-ma-b0-gf4-a0.pnvm       | Bin 27820 -> 27820 bytes
>  intel/iwlwifi/iwlwifi-ma-b0-hr-b0-89.ucode    | Bin 1539836 -> 1539836 bytes
>  intel/iwlwifi/iwlwifi-sc-a0-fm-c0-c109.ucode  | Bin 0 -> 2241720 bytes
>  intel/iwlwifi/iwlwifi-sc-a0-gf-a0-100.ucode   | Bin 1811508 -> 1811484 bytes
>  intel/iwlwifi/iwlwifi-sc-a0-wh-b0-c109.ucode  | Bin 0 -> 2140784 bytes
>  intel/iwlwifi/iwlwifi-sc2-a0-wh-b0-c109.ucode | Bin 0 -> 2269856 bytes
>  intel/iwlwifi/iwlwifi-so-a0-gf-a0-89.ucode    | Bin 1737012 -> 1737112 bytes
>  intel/iwlwifi/iwlwifi-so-a0-gf-a0.pnvm        | Bin 55152 -> 55152 bytes
>  intel/iwlwifi/iwlwifi-so-a0-gf4-a0-89.ucode   | Bin 1591984 -> 1592084 bytes
>  intel/iwlwifi/iwlwifi-so-a0-gf4-a0.pnvm       | Bin 27860 -> 27860 bytes
>  intel/iwlwifi/iwlwifi-so-a0-hr-b0-89.ucode    | Bin 1527004 -> 1527004 bytes
>  intel/iwlwifi/iwlwifi-so-a0-jf-b0-77.ucode    | Bin 1446036 -> 1447372 bytes
>  intel/iwlwifi/iwlwifi-ty-a0-gf-a0-89.ucode    | Bin 1679080 -> 1679180 bytes
>  intel/iwlwifi/iwlwifi-ty-a0-gf-a0.pnvm        | Bin 55020 -> 55020 bytes
>  30 files changed, 39 insertions(+), 19 deletions(-)
>  create mode 100644 intel/iwlwifi/iwlwifi-bz-b0-wh-b0-c109.ucode
>  create mode 100644 intel/iwlwifi/iwlwifi-gl-c0-fm-c0-c109.ucode
>  create mode 100644 intel/iwlwifi/iwlwifi-sc-a0-fm-c0-c109.ucode
>  create mode 100644 intel/iwlwifi/iwlwifi-sc-a0-wh-b0-c109.ucode
>  create mode 100644 intel/iwlwifi/iwlwifi-sc2-a0-wh-b0-c109.ucode

-- 
With best wishes
Dmitry
