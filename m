Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794560354;
	b=3tJJDgepnIVgPY/4kXdo3YE5Td8ZJVmXcp5sAd+KtYeFKsbMa+qfoDVBnT7VpE6Gwny3
	 u84iebKLt9LttKGqZ+poyGMFKzTtI63xix6bMZKlOa2rKAnVqRpYQ1QdQoIXmVYKf8/cJ
	 QrsP9xGqftTwmQv1yNEqNzmzxCmxKKxJhRO1QkwsKeb2MVaRffmJY3rylLi8SDFZ7R1tm
	 80KnR49vjvIrmUCE4t5Gc9bobiUAGvpTxa5hbE6+4sR6b492Yh3c7Tqgd40TCVzi2cHhl
	 /WfwaduX/fnT9UxK8kJTNSzOdeioo5GUzUqhO5J3UARg3CxUdfnNNyfg1y858Nx+HRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794560354;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JaCKuWoch5k2Kjk0XZXFM0Ps5nVvPhDt20xb/z6BgX0=;
	b=3j+U0V7DDD/JClRB936nf/enkwsZltB6+uaWspBRhtiYye/Dea8Sdxwxy5fl2oQs/VPr
	 bK/7hOTgRGOhOT4s+41Fa/nixd12uyzqpC1BFctWm5pVjY+hSid89ijGOZY+OPlEl/JMN
	 6S7L+juXvo579mMbLAv+9c4j57eWNo9D2A17xwJa91p0+09OzjNe0LSY8tj3Phn5705Py
	 SJ2itt+lUs2vdhfEGE5LDwUD8XaC8vQWcYlsPqOjE765X69uCQmQ4hyD6gX/3E3KBi+BX
	 R2yCGDFdBkeQpadQeG/XJ0ukQlwpV4A8y1jMg53XghNkuDbvxQ76vbsbt275hdTFZqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F0QAN3oS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PUsL2Ovg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B10606A31C
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 08:59:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3B10606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F0QAN3oS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PUsL2Ovg
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VDtt4163546
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 08:59:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JaCKuWoch5k2Kjk0XZXFM0Ps
	5nVvPhDt20xb/z6BgX0=; b=F0QAN3oSkmjXryB+McqTbr0iaQSPYlX2D23jMe7h
	tH3o7lIq0mdVAPS+NNwkMN/su6sThmzr5sTC6xO9v7mkZyvnbXjnxvw9stqfpXcu
	WX4z5RJ5SGXcBNzRjGxmp0W1VsWwkmDBOxKfLXPQ0TvbWSdmdMBxrXS5a5OvVClV
	m7R7GRaNqMoybnGaLWBKUlTU7aNy7HdZcr+xdL5tSAFNF0aNjCZxUDFtX2IDTEAi
	0bKR0qlla5OEvln95ah2olXoL9ZIPNnFq8By72s0o1qbkSNbIssU6OyCnUZ3GIqO
	z+pk7uXuVDRoBN+peJP481m6eCkso7A2PyYW5L4Z4faLpw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwh0ak0gc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 08:59:12 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so340523c88.0
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 00:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794560352; x=1795165152; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JaCKuWoch5k2Kjk0XZXFM0Ps5nVvPhDt20xb/z6BgX0=;
        b=PUsL2OvgtHQKHPyKHZeVdQQ+8S2AQf8C3jwXaGWqq85ic5TMRMp46k63kXbI5w1Wf/
         ZWtthaB8tX3MFPx1+MgGpUWpxDKKlGjhOfT4ukJQdYIodpzMsoB5bOi1Voiyt/YgEKyJ
         RYUQbs+hiImwJQU7Fy7HAMfrB10p0M2adxnWofKY90u4ucLipsjbFW71D74hziQkt0MU
         TYLdhTVuYcwEkQ42cgBqodnrwRzCp9CxJJRe6AcYo87CuUYHsxIiCSjvh6cuB6rEKSrv
         ffq+qoVnXa+F7J2/xtBqbaL0RNYHdYHt3NeC3Vt0U7+4Vf1gJW5OSdJ7849rYM8K16Q+
         Fepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794560352; x=1795165152;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JaCKuWoch5k2Kjk0XZXFM0Ps5nVvPhDt20xb/z6BgX0=;
        b=MbPWaA1Jv49h2CqsylJmhtuSKD3aafrY2ql6Du6BbabruZmtzLW10mTwsoR4cL3skv
         55vKR6FdHftSar2TTgtGWBQch3QtfBcNi62x9m375bcz2cNEjq6eQZXDMrgOnxqFGFn0
         aQPKSy8Fug1Fpr25P8+faWsRAnt+VIheeHjUkBidPUHRa7E0+50iXzDnB5Fy2Spmh3pk
         2qSKT6+viTYeEB4pkccilAJXvYJmAmYxL7LeQkj3aziTEjbRFL0bWJFgc9lMEMWX4PKn
         d629IdQ5Q63oMhrxGtBT4S56UDqvdUNplczeRCAg+TxbNKxMaSIr2oAJMP5an4umY/1/
         T+Lg==
X-Forwarded-Encrypted: i=1; AL+hErE7bkTRF0c1NtoxHoF2O+m71pCnT9/Wc5m8/CNTlerstisP/2ohgyL/NoUZPOaI+oOtHWK/LeH1lqgAGUWJjw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+P13oYldi6LNBny/R2Dg9c8VoIrADOgx6WMk7EI6weMWcYaLrh
	EDtA2kjIyfVcC+7ai0T9sHgcAeBUQkW7Vr5nhCwWE0P7Gh7DbkTjOMKSLyeY+PkAUwc8a+AK+Jf
	TVOaF8z0IwDCgTZDoX/uEqknCC5HdT+homZX8GnEg6kF0cdIa34V8W+5PJMXAHWBjgkQoYQ==
X-Gm-Gg: AYBFou250yfblJdf4e8UJqLvE21bEtowvs0q/EWhnyYEyzyJ+BviVb4HPJK2tQsok3Y
	xT8Z3GVUAklycliuVbV5+9nfFpRIdflubJtFTPb0pE5Wjzc8cay17/o1mzJ7ufzKj+1ltsdE3DO
	DqQBfpDtyeZEotKmYOrSUVPSjO81hIs20GDn41WPzWDpNEA710jAduWBzoj62VuWZ6/gXop8mB7
	ndWTc+K76Z2tqMHLjqyelJvw/Bq+tROlyp1Mbvg6oPgrA8iJthvlqj6F91WSBinXLeD1lHqJv3L
	5IFWIiuza3+xmkx4Cbkv5gojjMv657uxGDyoIQfil1CaT2WuGyRsYEzTK8ZJBk/8ohFT48t6Gki
	ZyvpV9pAwYQrP90qD/lIeiZBH0SVUN7Y1ARLAladrAaV49UgtS4mae6vyu4m+J86W3z7HQU/ka2
	A=
X-Received: by 2002:a05:701b:261c:b0:18d:5988:8d3 with SMTP id a92af1059eb24-1b5030684d9mr1933670c88.3.1794560350783;
        Fri, 13 Nov 2026 00:59:10 -0800 (PST)
X-Received: by 2002:a05:701b:261c:b0:18d:5988:8d3 with SMTP id a92af1059eb24-1b5030684d9mr1933628c88.3.1794560350098;
        Fri, 13 Nov 2026 00:59:10 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50313d8f5sm8926890c88.3.2026.11.13.00.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:59:09 -0800 (PST)
Date: Fri, 13 Nov 2026 14:28:56 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Alex Elder <elder@ieee.org>
Cc: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 5/8] net: ipa: migrate firmware loading to
 qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Message-ID: <20261113085856.mpa2zi4argm2e6y3@hu-mojha-hyd.qualcomm.com>
References: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
 <20260925155737.4161358-6-mukesh.ojha@oss.qualcomm.com>
 <ccf0300c-80e8-41a5-a394-6ec55fddc913@ieee.org>
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
In-Reply-To: <ccf0300c-80e8-41a5-a394-6ec55fddc913@ieee.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzNSBTYWx0ZWRfX05oPz2wYSI8e
 1uPF/ISXPfLxVgeHk0Ydp7GTwHrN4aXtQ4slfRM+7UjEF2jxX73nBJVRySMfJO8bvW0H+8q8qFZ
 3BGZpLmwmUXw+UZm1a3L00OI1p6Yj94=
X-Proofpoint-GUID: gazwHsM-60OZzuTuHmlU8kFdsJDYUUqr
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6af6d160 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ee_2aqc6AAAA:8 a=s4fcayaxKqd7nPnH_LgA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzNSBTYWx0ZWRfX3YtHUqXHjYhS
 N0Mjr3eIatp15CqvQf9PocpmyCKw0dg+PaBBnMShmdLjffPZ7J1FMJDtIhUoC2KPs4CIHaMGe6i
 HY2UfuFT73h8M4N01de/Bvtv8rgu+Eo58WHJzviyC5+ILHe039dsXCupDWqpxE9xuLTFZSdku4x
 nNbYSfXvj/9ESRrqF9SmE3pADyWE1wGj1Owcv38pO0a8c9QxcBUGJrDs5kdxwKzeDI1mHmdlCaC
 j/+QyFWZHy/V3j4UOdeus7S3+U8iVkqYrIXvHcu29rZsKUvF0LdLJPZggd9hpZb9sSdhb0duCS/
 IoXCGtghyog1Anvd9LauoADdn4M1vGbrqeUolcXTIoFu8DiQ9wNgYITlb8z9Xpv1Z4oZrHOyBUL
 B169JyGv1oE1ejs69xsgw/rVHoPjWqRjMmQzVSQFxEg5FAwr+fQ41uXs3cNjp0z5swVxeCuIi8r
 H8/7zXNO3IwRT8uSJ0w==
X-Proofpoint-ORIG-GUID: gazwHsM-60OZzuTuHmlU8kFdsJDYUUqr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130035

On Tue, Oct 27, 2026 at 07:49:03AM -0500, Alex Elder wrote:
> On 9/25/26 10:57 AM, Mukesh Ojha wrote:
> > ipa_firmware_load() calls qcom_mdt_load() which bundles metadata init,
> > memory setup, and segment loading with no PAS context, then calls
> > qcom_pas_auth_and_reset() which skips the shmbridge prepare step required
> > before TrustZone authentication.
> > 
> > Replace the open-coded memremap()/qcom_mdt_load()/memunmap() sequence
> > with devm_qcom_pas_context_alloc() and qcom_mdt_pas_load(), then pass
> > the same context to qcom_pas_prepare_and_auth_reset().
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> I think this does the right thing, however the IPA driver does
> not use resource-managed (devm) interfaces, and this would be
> a first.
> 
> Why does "qcom_pas.c" not offer an interface that can be used
> without devm_kzalloc()?  What if someone wanted to pass in a
> preallocated structure to be initialized with the (publicly
> defined) PAS context?
> 
> I was going to suggest that you just rework the code to use
> gotos and the cleanup path as used everywhere else in this
> driver, but it looks like that's not easy.
> 
> I'm willing to ack this but I would have preferred to preserve
> consistency.

Ok, let me fix this by introducing a new API to initialize the context,
which will only initialize and not allocate. This will also fix the leak
problem if the earlier API is called multiple times.

> 
> Reluctantly:
> 
> Acked-by: Alex Elder <elder@riscstar.com>
> 
> 
> > ---
> >   drivers/net/ipa/ipa_main.c | 24 +++++++++++-------------
> >   1 file changed, 11 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
> > index 14ac2d2faf7c..6964395caedd 100644
> > --- a/drivers/net/ipa/ipa_main.c
> > +++ b/drivers/net/ipa/ipa_main.c
> > @@ -585,12 +585,11 @@ static void ipa_deconfig(struct ipa *ipa)
> >   static int ipa_firmware_load(struct device *dev)
> >   {
> > +	struct qcom_pas_context *ctx;
> >   	const struct firmware *fw;
> >   	struct resource res;
> >   	phys_addr_t phys;
> >   	const char *path;
> > -	ssize_t size;
> > -	void *virt;
> >   	int ret;
> >   	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
> > @@ -615,24 +614,23 @@ static int ipa_firmware_load(struct device *dev)
> >   	}
> >   	phys = res.start;
> > -	size = (size_t)resource_size(&res);
> > -	virt = memremap(phys, size, MEMREMAP_WC);
> > -	if (!virt) {
> > -		dev_err(dev, "unable to remap firmware memory\n");
> > -		ret = -ENOMEM;
> > +	ctx = devm_qcom_pas_context_alloc(dev, IPA_PAS_ID, phys,
> > +					  resource_size(&res));
> > +	if (IS_ERR(ctx)) {
> > +		ret = PTR_ERR(ctx);
> >   		goto out_release_firmware;
> >   	}
> > -	ret = qcom_mdt_load(dev, fw, path, IPA_PAS_ID, virt, phys, size, NULL);
> > +	ret = qcom_mdt_pas_load(ctx, fw, path, NULL);
> >   	if (ret) {
> >   		dev_err(dev, "error %d loading \"%s\"\n", ret, path);
> > -	} else {
> > -		ret = qcom_pas_auth_and_reset(IPA_PAS_ID);
> > -		if (ret)
> > -			dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
> > +		goto out_release_firmware;
> >   	}
> > -	memunmap(virt);
> > +	ret = qcom_pas_prepare_and_auth_reset(ctx);
> > +	if (ret)
> > +		dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
> > +
> >   out_release_firmware:
> >   	release_firmware(fw);
> 

-- 
-Mukesh Ojha
