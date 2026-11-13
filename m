Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596640;
	b=dorj6oOZmQ+zB3CRMe8oSbnwG05SBAoUvtLhXjdbZkY6PFRCBeSApcUy7OnXmq1CD2n7
	 /BHU+wfxDkRgm5zhUS5pLcBI1mRXAJfECY1rNtRD02ce1UnE/kPs1qFkjyxDcaCtyvhcb
	 HSk8QXqGwMK8Yk4ZCeXAqrRCaxPEgHFEtEi8N7IRuuyR8VvjzyfJy1RjB4VNBArEFd03e
	 kXVrh+PmREjQf/XgR2XVR81cYjiWfubpxNaUbeyBGFKNhnMixFJQ/RLLelxd6zu5JHkUO
	 2EsL6wTSJGrarh8nQfBzLWi7/X7tYTKXDH14r3T6TwDT+t6mRPVva22ZZ7EO7EJ+MbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=5v4390+5+0gQiMHK1KicuB/Gp64Vkth2gdQzKankJ34=;
	b=aRuSC/31jGkHyHUuTrPa1LMO9qNSHOzRkzZrsCSSLjFN2b9fL5JP+SlNOZozju3Z3nO9
	 6lPRAGSYouhr5fPP7yZgRrqs1lhm4KdtXAl7YYa3wUp6smJmD3rC8yMDMOlrzhgqXEIx4
	 ZunFLjdGa8oN/8Qh2dRfwPpi5zw7hELzXwQGTKANJj6AKKRpYv542se7yInPckuu57DdF
	 XJ01GT6fTGL5y5Ga1zdlgktfEIk5Mx5Mw6lIGvcBEQv2f0HjiAGG3buxEtTscSapPuqY/
	 qatUgwvEquLxpi5n/hgkB1j38/5Ng7KRF9FINNE0vVYMsll/W7h6c2xCHMZatvyqgvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ieee.org;
	spf=pass smtp.mailfrom=ieee.org;
	dkim=pass header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=OBl7H+i6;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D111606A33B
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 19:04:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D111606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=OBl7H+i6
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91e8a05ec5aso27611186d6.1
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 11:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1794596639; x=1795201439; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5v4390+5+0gQiMHK1KicuB/Gp64Vkth2gdQzKankJ34=;
        b=OBl7H+i6ZwCYqyZENMFkOks9QMvP3Q1O5CrDefd7QEnoWxR7Gzg2PWplPwjprGwO9m
         ONLcl2A+SicRV5yCDWOMiHwCcJzaUmNARnD8racf2rem5cydfXkKMyTLGas/HjHQXhp0
         TTMH+rLW9ObkrPLd+QQ+P9H/NwQsFwau/hQwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596639; x=1795201439;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5v4390+5+0gQiMHK1KicuB/Gp64Vkth2gdQzKankJ34=;
        b=eo17LWr4mqYk4jesHI72Jz3twCjE4PyM9+6nw0BF/bLPZBGv2iR/9C4ChItfdLIF/K
         8fHGaeSdYmw3YdWxmqvLycjscbRn/wc0Ngx6fzhCMBY3aDUCqVSfUHo+hj6vJTHGs/cw
         gGnH+8UhpAcpblhnOyIWlmEUwv1RGWrsMb1+LAyp/7yjwEwGZg6qsxVFVgIgWncJ8DB7
         QuSODp2QVXMFo7sPkSAdroa4YJpCgXHKTQG8A3pWYC8omW8mKrkO6/ZZZI+gPbulvFd5
         /aK0G207QpWMc0UqT5jcCgDHIuqlE241gUmM2P8k35HLw5x7F/eUvcV6UEEOklaqHE1Y
         J7Zg==
X-Forwarded-Encrypted: i=1; AL+hErFKZLSV+2tG8AaBfuAdBxHyq4pYaWR3KLEdgY6lUVfOHUg8T2z6XS8Rvp+7lTp4ndX29OARR7pQFtnS3sJbfg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZLZQC5+l1vIU64vLcrkS4+DV99aJ2E3Ch5dpma/KgUQMNga4o
	3Gy17ZH5JmnpJpRpl5AxBqFpfDxhL7gIDFhlc6376XB7JF0FMe1Hs1T9cXN/UP1ejQ==
X-Gm-Gg: AYBFou07LZdWiiTd61EEMl+pcZwiUNkiU8C/EtXct0OMwsA1TnVeSNdYIyXHxSZOAq6
	4Io5pGnUHCoX9EC0RT03GIJTfDmlEHMTuIorzcczoAJAOFpfTrJSoSRtNiIkXgVzTUKQZ52G73Z
	RfJuIi5FHrbDC94dHHQpQK9af7qy3U8WEW5FCiFBIbzcLaH7uMVlOZhaL9RuTGQgkPOmymqcmdI
	j7uvvCTv+5GYNpsswgQfD9Vhm12ep4EVEKuFEC4yoXJ7RQvONTaEQcdIMzYioeKEOpY2skCfx9s
	1bGdUZOr9xVIsdSUwBTikDr4KNwEcjb3GtDpauvZPsobfg71oOF4FKEoAhseV+4+GHVaGIW52Bv
	/kGlUlAN9uYkmYE4Wgk2hJAqX1yomU1PYNnoDkmvNEZWYDUJoEy+RwWPJP8cSrqXYXMxRXdmiGy
	HNlrkjWvRke155yTBGSgo5HZDvsDG8X/ijPeFIiVNPiJSkON8am1KcQrWQr5+nAvkA7b8lvxDji
	ZeXt5a3O0M+g7Ta0pL3jk9isWM64MfT6TMyYx8+3BV+M1oBHWxgZxWOaTprtAsBcfEwaj+3nUKf
	SuJ9XySYzggymN9i5ALQHaLO
X-Received: by 2002:a05:6214:4409:b0:91c:74ce:a452 with SMTP id 6a1803df08f44-91f241ddd3fmr55479136d6.46.1794596639018;
        Fri, 13 Nov 2026 11:03:59 -0800 (PST)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-91f23d780e8sm27000686d6.27.2026.11.13.11.03.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 11:03:56 -0800 (PST)
Message-ID: <1b84bbe8-28b6-4a74-af0c-5b9cfdd8b394@ieee.org>
Date: Fri, 13 Nov 2026 13:03:53 -0600
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
Subject: Re: [PATCH v2 6/9] net: ipa: migrate firmware loading to
 qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Sumit Garg <sumit.garg@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Alex Elder <elder@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jeff Johnson <jjohnson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
 linux-remoteproc@vger.kernel.org, Alex Elder <elder@riscstar.com>
References: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
 <20261113185009.157893-7-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20261113185009.157893-7-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 12:50 PM, Mukesh Ojha wrote:
> ipa_firmware_load() calls qcom_mdt_load(), which bundles metadata
> initialization, memory setup, and segment loading into a single API that
> does not expose a PAS context. Later it calls qcom_pas_auth_and_reset() for
> TrustZone authentication, which is the intended behaviour. However, a new
> qcom_mdt_pas_load() has recently been introduced that works with a PAS
> context and can handle everything qcom_mdt_load() provides, along with
> additional functionality such as shmbridge creation and retrieving memory
> from the shmbridge buffer when the same remote processor needs to run while
> Linux runs at EL2.
> 
> Replace the open-coded memremap()/qcom_mdt_load()/memunmap() sequence with
> qcom_pas_context_init() and qcom_mdt_pas_load() and
> qcom_pas_auth_and_reset() with qcom_pas_prepare_and_auth_reset().
> 
> Acked-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

I haven't reviewed the rest of what the PAS library does but
I trust it does the same thing as this did before.  So thanks
again for implementing the non-devm interface.  This looks
good to me.  My ack is already present, but I'll reiterate:

Acked-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/net/ipa/ipa_main.c | 23 ++++++++---------------
>   1 file changed, 8 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
> index 14ac2d2faf7c..0a37741c2285 100644
> --- a/drivers/net/ipa/ipa_main.c
> +++ b/drivers/net/ipa/ipa_main.c
> @@ -585,12 +585,11 @@ static void ipa_deconfig(struct ipa *ipa)
>   
>   static int ipa_firmware_load(struct device *dev)
>   {
> +	struct qcom_pas_context ctx;
>   	const struct firmware *fw;
>   	struct resource res;
>   	phys_addr_t phys;
>   	const char *path;
> -	ssize_t size;
> -	void *virt;
>   	int ret;
>   
>   	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
> @@ -615,24 +614,18 @@ static int ipa_firmware_load(struct device *dev)
>   	}
>   
>   	phys = res.start;
> -	size = (size_t)resource_size(&res);
> -	virt = memremap(phys, size, MEMREMAP_WC);
> -	if (!virt) {
> -		dev_err(dev, "unable to remap firmware memory\n");
> -		ret = -ENOMEM;
> -		goto out_release_firmware;
> -	}
> +	qcom_pas_context_init(&ctx, dev, IPA_PAS_ID, phys, resource_size(&res));
>   
> -	ret = qcom_mdt_load(dev, fw, path, IPA_PAS_ID, virt, phys, size, NULL);
> +	ret = qcom_mdt_pas_load(&ctx, fw, path, NULL);
>   	if (ret) {
>   		dev_err(dev, "error %d loading \"%s\"\n", ret, path);
> -	} else {
> -		ret = qcom_pas_auth_and_reset(IPA_PAS_ID);
> -		if (ret)
> -			dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
> +		goto out_release_firmware;
>   	}
>   
> -	memunmap(virt);
> +	ret = qcom_pas_prepare_and_auth_reset(&ctx);
> +	if (ret)
> +		dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
> +
>   out_release_firmware:
>   	release_firmware(fw);
>   

