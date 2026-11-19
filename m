Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795080945;
	b=LReta69vcxEZ1pU0PXmwGYmVqeu3GM9CaHpDFk2E/I7IMI5HdVPPU9Bki05OP0NqhTHV
	 F14VG61FsuYqR1YT2jtBkj8/fBmUBiwsuiN4KXiM66S/DjD8lo7fW4UPhFLiQzfQItnRQ
	 cu9Ib+D7sNQLduDFiW3r69kM2Dju3WbUS4nFchHYECV7j2GnUp+3aD2OY6vtSUKCxvq3H
	 eOpJ/PwPItYX7y1R1q6gtcZaIO/5jopGRB8MMPZCajd3ZbPXTZq85lrKLTY3e/evqfwz/
	 WF1U10yXU9vlcf6R4GgWJ5Cck4jil2+c6WfvXZygeVIN2B95Z3eP2brEIjPNA5zsFJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795080945;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=JOFWnryy22U8bQSzM6KdqLeAcd1quBBtSo308pXYk6c=;
	b=4SDpcbx5i0M/Ws13MUvTwCdIs+sya24+VvHwP29fUf7ldvfz65wJV6nnoK5fxePvh2wn
	 fS9njWGSHjnV6geSYE/v46SrsZveore/H9jbfIQBcMmhoCLTYaVwVqy8DJO3szOETjfvl
	 L/SpJaEEGpdJlTV20HNIcFzPn1zgxHOOr7TkNhjrM+L8zzd3lC02umtVFiIq9a4EKmsMW
	 /YzCd1ywTy2SOYtWHZyePYo80Tz27H5wUqeX4IWKbxZk8LBa1egidGSTkchsMNEQS3wha
	 JXZJR1ntQBRNndI+8g9SrZ27QdRgrt6XfTPRyYnlslsypurgT9RboDdMCHkvWwdPY8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SmmjV7UC;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=dSJBwNcU;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA53060A2608
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 09:35:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA53060A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SmmjV7UC;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=dSJBwNcU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795080944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JOFWnryy22U8bQSzM6KdqLeAcd1quBBtSo308pXYk6c=;
	b=SmmjV7UCuY6lfV23+ztvUNuvePIB8nL24A4S/Xz0Ijm0we47VoVb9DxW1oJL4JmkJhYuew
	o2De9zpB5vqRxXXChd0urCYJrwgang2nyDeuxYsYET+UkhNPxAOEl9Cuyfxvq38fRLX57v
	lcUylOHIXMyMLrVMnfBupXioMlnqB+c=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-fDk09svyOjGKgEnfHsCYSA-1; Thu, 19 Nov 2026 04:35:42 -0500
X-MC-Unique: fDk09svyOjGKgEnfHsCYSA-1
X-Mimecast-MFC-AGG-ID: fDk09svyOjGKgEnfHsCYSA_1795080940
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4a3052225cbso1816167f8f.1
        for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 01:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795080940; x=1795685740; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JOFWnryy22U8bQSzM6KdqLeAcd1quBBtSo308pXYk6c=;
        b=dSJBwNcUgfpqpqpcO00BqOgy6rn/27u4bSv3znU6NaisVn84/7OzU/9ig3OXS8+qsK
         qkKbiT4enLFnOOfvErU0mUGxO9SyqIicLhEdGhj161vtOw7rn06zu5zlfeN4M90uksHt
         BqdsSOZQ9+ChDM02orCwj2u0lN8u9SgDRjDOPlR2V8oX9zNrwJO8yCgUkeLrzbJGqLhe
         Gdo+aLVsRknjp/6HczOJxengWvca6cMc60CwN7kZnk2zIFWBWUiULNnSpqhanfL0AXUr
         uBGXqJNf4T4Ht1kz09UPFF3lpULA8QfuswA3BN77urak8D52Xy+IS+NFkuWseWi4Vwuk
         gtog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795080940; x=1795685740;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JOFWnryy22U8bQSzM6KdqLeAcd1quBBtSo308pXYk6c=;
        b=eRYAfFG89fnmMRX+z9ahQGsZuVVSRqq09QvLoMcM5ZOKurrQ7P+pVWtnAFp83/jPiF
         3gwnYl3eC0kmQHVoKDPWCuvwB91EZHOq3poqSzSQhrZfqS8oEV3hJtbqYefV2rqzfn7v
         BYjMMoz0dmSei7WeO48qps0rNWtF9VKkd2AbUn6YWCryF6YZ80YBImxqszaaM3ld6gz1
         iVcc6S3vocgbtmpi6hYnfR0MgQc+cBWn9wBBMlnrc2sRpWhF0/E0DN/UbsgXeAyAAhZw
         aY20gqC7ejmtJNcLIPqB2hr0sHcJoIpvy8J23lWqw5V66dnGNpnfhEQ/b4eObpaVplaw
         Guww==
X-Forwarded-Encrypted: i=1; AL+hErECxCVbKR8poNqxchcd+WlOpaEp0AGh1urs28SY4AUNy2MeQg/rw5nKZz2N9VYQebUgvm6IlF1fcmK4+ZmmKQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9fYH6UAhVC6I01nCmM49llMYtET2AfCrCxtkrlzZZd/pq75dMA
	LZ1bL+ygMYWKFqnGW3ifpqbCB4B55gVGolinPcNYRXYM6nOih/WNd0ivKQDWe/WFTIfmjUg4bxI
	83BLo7MOqR42qSZVSLugB2cHg4YGLvRO38lh1wgkorNOza0xPhpBT/QibhZUFkNgyMwSq
X-Gm-Gg: AZFdTZc29LikRwyf+32gZazXdn4S/nZfNNC35qgNdWeauWQqYLMjfVjWVyLDb43RivB
	R1KNMUIf8wxEfCihM0MooOMxEnrUevuYRig2RimjWE9Cqt6i4V4dkO7f5pVIDzqWNBBgpf7kpMg
	PiBdNusPXL4l5iZ2iMAP05tPHFMdVDpaxnMMrOhWijgnz2GeIeE6eM/HDnTbbFXKQwuS1QX6jhO
	pC7wPWQpCWime+3tTOqG9RF5WFYj4aPxBliQadXkmlozT0OZ8Y1iemLbZE+FHKmxG7kqj0/t3ib
	GpVPxuzP6NfAC8e5UILBbrkIfZsScO0DcLzWkLWIZXFftPIj59QMmls2BFvNoSgdW8K8u0u97xJ
	P8Ylqnj+9KzHtYNmbkQkUWk3QSLiOLSn3ToxldVcxmf8fvXD4O04c+vSkdUDfYURUvoh+6nMrVx
	4T0QdbPQPjNFna4+uJm+XsO//9u1+QBA1ViWZ8BF+KEu50
X-Received: by 2002:a05:6000:184b:b0:48f:bcdf:6f7d with SMTP id ffacd0b85a97d-4a63b6fbd88mr11817891f8f.34.1795080939844;
        Thu, 19 Nov 2026 01:35:39 -0800 (PST)
X-Received: by 2002:a05:6000:184b:b0:48f:bcdf:6f7d with SMTP id ffacd0b85a97d-4a63b6fbd88mr11817756f8f.34.1795080939199;
        Thu, 19 Nov 2026 01:35:39 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c39bsm9495655f8f.17.2026.11.19.01.35.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 01:35:38 -0800 (PST)
Message-ID: <4eea6d32-4200-4cd1-860a-70e81356678e@redhat.com>
Date: Thu, 19 Nov 2026 10:35:36 +0100
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
Subject: Re: [PATCH net-next v6 1/4] net: qrtr: Allow the host QRTR to assign
 a unique node id
To: netdev-bot+sashiko@kernel.org, manivannan.sadhasivam@oss.qualcomm.com
Cc: mani@kernel.org, davem@davemloft.net, kuba@kernel.org, horms@kernel.org,
 jjohnson@kernel.org, edumazet@kernel.org, linux-arm-msm@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 ath12k@lists.infradead.org, andersson@kernel.org,
 christopher.lew@oss.qualcomm.com, deepak.singh@oss.qualcomm.com,
 raj.bhagat@oss.qualcomm.com, juha-matti.tilli@iki.fi,
 jeff.hugo@oss.qualcomm.com, daizhuang.bai@oss.qualcomm.com,
 jeff.johnson@oss.qualcomm.com
References: <20261114-qrtr-multi-ep-v6-1-2eb9885659e2@oss.qualcomm.com>
 <179478985187.3136.15328141866524028119@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <179478985187.3136.15328141866524028119@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/16/26 01:44, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 2 · Low: 3
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] A failed node-id insert now drops the packet, where the old
>    code still delivered it, and a dropped HELLO is never recovered.
> - [Medium] In AUTO mode, nid and ep_nid can end up different, which the
>    commit message says cannot happen, and the rewrite logic then…

The first concern above looks relevant, and the 2nd deserves at least an
explicit answer.

In general you need to address (either debate or fix) every AI comment with
prio >= Mid.

Next patch as more of such comments.

/P

