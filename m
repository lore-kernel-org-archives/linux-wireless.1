Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794584800;
	b=TCr5+Nor3UVFK4yrebJhmgy3YXn3i4NUt60kIYGrwPd1x6spcHTKiKY0ZfkiQHMAYY5e
	 9jbJm/4uSgUKGr3+Q7ILQXeSuWqvVSUw/kti6Wm+eccTwj0O7+Wn9jU/IVa8YQhdXubEw
	 pm+3Pkl5cihR5fzPQuOYsL0qlhL+QFaAYmazgpr1W8PGJStp2qg2EF+q2RVtPpRiMjpkD
	 WrPAof8KvQ4i8DniDD70hqsPE6NBzkoXaE/wm/hGKFqb3NaG3elhqVUJ0e98SiZ9hOS3P
	 2ugI9ObyYOZ18WBvwEdW34BM1gzGv2AjKAkZgs1bUt5Y4nwi/ITPAFqjLBP/Phy5q4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584800;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EWqUlGlVZHACV08AdFucWTUI4cbZXYMPPj2UCfpzMh4=;
	b=DrUKuOKORey7uSUpmdQMih3HaoGFHvOJZSKmnlNWFwcDgBi1x4Bzd7fvzH0JjWsJCGYZ
	 +YzV+QcXEZ6vPh4Ut2nhELFenPPsCoQZNLRcn9IKQygwdHAZwTnBfO4bFS1YxxMj6limq
	 8U31mWjkxfzo+SVvCVz1uYGBajDqD9ShSWN4KaEcQFeonMIBb8whyX4qRZS0+3zpqMX4Z
	 K91xN5vMC+GjUQas5aF768gvKpN5gtqBwsMRSfw+Xn9wIvYdP4+Ag6lJLyDCNYgJKuCbz
	 w4SjB4cYU/bTuIa5pWwm8mtSYgel3zeFqZbdo5FIHBoHV3p1vsvojMD5gK5jyCuMWKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bbSAKYvX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UrfNPUlL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E99606A32D
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 15:46:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2E99606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bbSAKYvX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UrfNPUlL
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFQwml074887
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 15:46:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EWqUlGlVZHACV08AdFucWTUI4cbZXYMPPj2UCfpzMh4=; b=bbSAKYvXGPvY0V+N
	bRG4Xt3FavZ5yMSnamztID6YOs2nG5iqmKqal1KXsVHcKuu9c9TtY/Dx5CUQDZSU
	i/IVhBT9pio/QK0QcHi+XJgKNSKHHM7O7DZXDR0aErFywvK5ymRgqcLBEu0k4Cgk
	9Kx1aPCQFjevHwOaySSk58RdPJH/p/QxVsqxVyDSnqWLlVJwNFSolL2yBumQn7r6
	g+K7FL8BVIjcgx9Kwso7KI97YqLBb0PxNSvrNBDjosi+wajwg1P5NHfWcv9qTFV7
	bzEvqB5k2aiVkbAckBc0AUrnoBt+oScbHpRuF2aS1G/PEGSVn8Pna13vR0mLxSxa
	p7X14Q==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwu2mtdk1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 15:46:38 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-82315dbce25so625942a34.2
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 07:46:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794584798; cv=none;
        d=google.com; s=arc-20260327;
        b=OovewdUo6qeCvx4vZA+oTQByDapF4f5WmaAz3EJkdq4FW4YPkaHYTuP6Buzfk8oDHW
         ks28Iznyypr54ujIUH/HrcxOymbiQbO9NPZLf41tEtSIQDzmlC9yvUgn3S6gvWDNNmLK
         a/R4lusbjdQL1Y2hvjuDYjfkW/z68TgQn4yRIUXZ6s5s9ax6zAfZWMnvkwrBEEGqBKKD
         E5cJnq+OeEdq7RiD1ZLWzIq8b8Av9aNM8enTe+k/3WQZasndwE3p3Olvb0Fb/T5Y4q8f
         lMf6gIl0Im9j5+MKQWf0Lj8ZIFgE5ehOyF+Rz/mhRnc0d2R0kteb3Cavp3IZZvJkGAUz
         jO0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EWqUlGlVZHACV08AdFucWTUI4cbZXYMPPj2UCfpzMh4=;
        fh=ICU6KIWuVBcR0YTj4UAP+JX1xNjyDUTfC4dr1n2WAEY=;
        b=TSxQp1jgXMWfE43hvCnfS2pICmLZ5Duc+g1r5U2DoTIbN1PNnPUdj65gsTCqSATCRf
         cj9cPvAvhw9I3WHViq8RxL2IEIr2M9tjV6T02lWM8vFn1Qb+3+Rq3a0NBK+sjbh9JtX9
         FXPanvChmQgntBD4WqRI48tzIiHOc8+4nzqTGDwqdph6wxGb6eJOCOEj5JaYXXqC4wOf
         2KM2Yh7LxjMo7qYBspOl4VcZadxibq1Vg7pMijP4yxKUzU0dA9LfGK/8zchVY2XtCgBM
         KKKRXL+i00sqMbfNbMLkipFtp40/qYzC+e8aT09MnvrPnQa7+NJJGim9Vxey9lzOmAW+
         XPMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794584798; x=1795189598; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EWqUlGlVZHACV08AdFucWTUI4cbZXYMPPj2UCfpzMh4=;
        b=UrfNPUlLexK1dlV5RNt0t34f3TQQcHrzJvV+vRe90Ip0VwPah7lPJoAPFo+6bF7ScP
         +hTQmtCiMLnD8yHRBx6jgcpuOaLJPHUAiDITkb+XgiIv0Pe6CW8YG9gLS/x+hT04C1Fs
         ea7f97FR1sMFg88u6IFScnvUvJLzdCA4vIV6wgmgj91XRxlaQn5+mdVzIYJACWoNX4Tj
         X+5+9iXASzLM5VelZ9VKYQqkZ5GZdXFCDlTnnVKfCxVzIf/y8L5XKj6YbaTJi7+IZsGW
         6ScMKVm4KrKU9z94yBDc6N45Vb7F5RDD3KN8xVYWsUACFVm7r6/UX1lCDz3yHWaru8dF
         EYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584798; x=1795189598;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EWqUlGlVZHACV08AdFucWTUI4cbZXYMPPj2UCfpzMh4=;
        b=O6CyHwwrQXCgx5gbZp1LHM2DPy9dJxSmEt0u4UMo7b4NYCqZOl/tbiYCBXx97PvYBp
         Rp2zDItXx0PqwES0lmy8RTvyAlJzxc/GPACj4duh3/MbilzhrN7g406XOjy5pNLCQJcU
         AlObpE/moEcPMQXwzB1/uHTaqtJEEr+0DEtUAaKNjbWrkq/vhQQ/VbEt81sXhtcMZ63c
         fKdfCeO1VSLLuYhJtqfmsCo0CaHAmK5rugB7c5f11pD6AaB40NlxItCwyMbSX1I3XHUo
         KOevMxWLAavwTIz0L/mzAIFz69HuRrmv93T1mYpbJdBy0z3f1+HRRo6qmheiJBnQDrIR
         STuw==
X-Forwarded-Encrypted: i=1; AL+hErGHq84xsoew1vbNBaCeYVuuZgxSCAlR1QZtM5pX8sEjFzY+ZviBpBS3BO0o4M2pUwFI/2XH8wl3Fd+dTVcqUg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/hrneUNX5rCSCheelOPFyiqNsqYVsShuJdqrv+jLCycL3M2rmU
	mH+bJSwTHPaPBx7ziMIQq7K95VOhwV2txpqA1R6yOwTVJVZdh5hz7SAnTnRPEfiNXruPbwafArA
	A8IHMjiYhkjeRikQiY2R9L8MiCXaqcMOiQEVUHbfj46KOuhGJm5UfnUMe5F63UkLysLT7lScufI
	Ueqi0TJaSp5gcLvNfpP5ZCH8DT3Kf9ry7gEHFdPq8jNoOp
X-Gm-Gg: AYBFou1Cwl1yWz42qCRzGb5w4BTN9ZrnqCQ45SB2t0YD2x7QIObeHB0Q9UN2XR1mW/L
	XnCZlFp3cQGyLFwHV+XYm3f71NLnG/2y/ZTLW96asBU/ljOt9NUzBxgTURZaSzOA9wSeYO44ym3
	Ja+en5p1jDgUtoMgUL5xOuJQEXDMjcdz5CiuBsUw54xA2OfjgVFaTygFZ5scKttzJ+xZ6QGRh7y
	g6FC6BmqTo3tfkWswIeWzeTZp2hiWe15OY3v9BllJnZp+ZUxmROSnG3OSEANKKa04rSM77Zl3Y=
X-Received: by 2002:a05:6808:1303:b0:4fb:ac9b:b084 with SMTP id 5614622812f47-56e6530bb19mr2540033b6e.37.1794584798043;
        Fri, 13 Nov 2026 07:46:38 -0800 (PST)
X-Received: by 2002:a05:6808:1303:b0:4fb:ac9b:b084 with SMTP id
 5614622812f47-56e6530bb19mr2539998b6e.37.1794584797569; Fri, 13 Nov 2026
 07:46:37 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016-ath10k-series-v1-send-v1-0-c847697b3558@nagashi.ma>
 <20261016-ath10k-series-v1-send-v1-1-c847697b3558@nagashi.ma>
 <CAFEp6-2xY_gM=FRUp3R30TZ-NgT=-eYnyz_BPE0vxEenv+202w@mail.gmail.com>
 <CACB3TCKq--tdL6j+uGR_dxGdy-gHxQhY8p0h6xxqi_4Fd3VEOQ@mail.gmail.com>
 <c45bdcae-63da-4552-9e35-59ec6a71621a@gmail.com> <CAFEp6-36Fc15uDWSR=v+xCMhERbkhggZOBoEFTF7pAcRLz_vFw@mail.gmail.com>
 <CACB3TC+NVYPbNKeOu9aAnRaCUTTon4PAO+kp_QbLqL6qd37aeA@mail.gmail.com>
 <CAFEp6-0AJ3uGn0pR7y7+PLhjf6AMYb2aBvPpq9J3QFRk9XJv1Q@mail.gmail.com> <CACB3TCKw=BCtRpJQ6N=moO+qpVu-Zd+J8LfV6S8pX1JiKS5+7w@mail.gmail.com>
In-Reply-To: <CACB3TCKw=BCtRpJQ6N=moO+qpVu-Zd+J8LfV6S8pX1JiKS5+7w@mail.gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 16:46:25 +0100
X-Gm-Features: AclHuK8sUK0_ujE66S2lKh9E6PaK84E5j9tQjywkDGncX8ILJWnaaM_7a6IV7jo
Message-ID: <CAFEp6-1xf+ab7FhbBJPH05V7zK+bs4vVwVHJCHZEBCbjcKw9EQ@mail.gmail.com>
Subject: Re: [PATCH ath-next 1/3] wifi: ath10k: set the PMF peer flag on WCN3990
To: "Nagashima, Shunsuke" <shunsuke@nagashi.ma>
Cc: "Conn O'Griofa" <connogriofa@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org,
        David Heidelberg <david@ixit.cz>,
        Fabricio Akio <fabricioakio@gmail.com>,
        Aleksei Kharlamov <aleksei.kharlamov@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 3EB6t8X4SeNUaQ1kRhG7Lq01Y3eOaX3a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfXytpv1iu9eZbM
 MPsybrtYa+/yFL7VotwvvA9+Uc9LpuEpGcUG46hLUTwbt5fI7/LBPrWaIUz5SdkXQn9U2J2j5Rs
 lPRt95tfOXSJGeZTdYy10oHyP8cSQexGFy0i/kB9u1he4tIO0Z88XwhT2/ZvE+cZQtrUmkPwtN5
 mgQjjfXEKFp2vdkFiY71O3dqajp9GBia2ve/45ynA30/Yi2noT4u/87sU/N6l2H+4+Y5UcblVv6
 V8QXV0uMYEOQhWMPHbsFETLbELyqovoEHppGfLoLy/X7SxMuYmkr/rOXzVYmyHMTOnc6APeUunG
 M2Slrnj+HBQPameliXNMhXVx7Fb3nq8fBszeRG5nh7Ig8HFqb7dZ3pslDgMKti8JxGvNXVGKLoc
 sXTV1NjfOJagTpg6hup8clBhdG2DpbsLsKbVQy87IBhyoy8duKrNfOumj0Dp9xViQIAajXb9Yip
 dCr8PW0k/qQUFhLV/WQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfX46EsCksElclf
 GeVeg//2BESEPjaQLFCBCo+KeZqSHV0hdywktsPqYTbRk4YGVe5ouzJZm5VWDPorKCr0W2M6I06
 1AwCssZA7/7KJO4RGC9WrIcRMUT1YCM=
X-Authority-Analysis: v=2.4 cv=ddQVTnXe c=1 sm=1 tr=0 ts=6af730de cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=4MXX5DyrQvMvXEW-PiAA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-GUID: 3EB6t8X4SeNUaQ1kRhG7Lq01Y3eOaX3a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130062

Hi Nagashima,

On Tue, Nov 3, 2026 at 5:45=E2=80=AFPM Nagashima, Shunsuke <shunsuke@nagash=
i.ma> wrote:
>
> Hi Loic,
>
> On Tue, Nov 3, 2026 at 2:46 PM Loic Poulain wrote:
> > If Linux-firmware ships 01387, someone will need to confirm that the
> > MFP capability addition works with that specific firmware version. For
> > QCM2290, I can probably test it myself and provide a Tested-by tag if
> > you can describe the expected testing procedure.
> >
> > Yes, to Jeff.
>
> Thanks. Then I'll start with the qcm2290 file only, and leave the
> shared 01387 file until someone can test it on a db845c or an axolotl.
> Note that qrb4210/firmware-5.bin is a link to the qcm2290 file, so the
> change covers both.
>
> Test procedure:
>
> 1. With the current file, dmesg shows these features (crc32 a79c5b24):
>      wowlan,mgmt-tx-by-reference,non-bmi,single-chan-info-per-channel
>    Connect to a 5 GHz WPA3-SAE AP (PMF on) and run iperf3 to a wired
>    host, up and down (-R). Do the same with WPA2 on the same AP.
>
> 2. Make the new file (qca-swiss-army-knife ath10k-fwencoder):
>   F=3Dwowlan,mgmt-tx-by-ref,non-bmi,single-chan-info-per-channel,mfp-supp=
ort
>   cp firmware-5.bin firmware-5.mfp.bin
>   ath10k-fwencoder --modify --timestamp=3D1706616060 \
>       --features=3D$F firmware-5.mfp.bin
>    md5sum: 58982403c9c56a4b888fe0ab3104d7de. Only one byte changes
>    (offset 33, 0x00 -> 0x10). Without --timestamp the tool writes the
>    current time and the md5sum changes.
>
> 3. Put it in place of ath10k/WCN3990/hw1.0/qcm2290/firmware-5.bin and
>    reboot (ath10k reads the features only at probe). dmesg should show
>    these features (crc32 f9e8f071):
>      wowlan,mfp,mgmt-tx-by-reference,non-bmi,single-chan-info-per-channel
>
> 4. Repeat the iperf3 runs. Also disconnect and reconnect to the WPA3 AP
>    about 10 times, note how long each reconnect takes, and check dmesg
>    for "firmware crashed".
>
> On my comma four (WLAN.HL.2.0.c10-00459), adding only this bit to
> its firmware-5.bin, with the kernel unchanged, took WPA3 from 22.6-31.6
> Mbit/s up and 21.6-21.7 down to 273.8-287.7 up and 242.5-243.7 down,
> close to WPA2. Without the bit, ADDBA Requests went out unprotected and
> no Block Ack was set up, and with one AP a reconnect took about 24 s;
> with the bit it took 1-5 s.
>
> A failure would be an association failure or a firmware crash. If WPA3
> is already close to WPA2 with the current file, please tell me too:
> then this firmware may not need the bit, and the test only shows that
> it does no harm. A monitor-mode capture is optional; with the new file
> the ADDBA Request frames should be protected.
>
> If it works, I'll send the file to the ath10k list, to Jeff with you
> in CC, with your Tested-by.

It works for me on qcm2290 (Arduino Unoq), and greatly improves
throughput on my WPA3 AP.

Regards,
Loic
