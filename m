Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551250;
	b=wupxRKoIrhS2OvSLxjBgEDklrfOUiMp42KfsJNL60VXNNOvo87Fgv0Izu0iFt+CJOdGh
	 mTnPIvLqlH6Z5YkdxNcTXP4sJO7TVSXlTNYlr2bDt4CTeisxW/KGIoNB5+5T0plEhMX93
	 dKp642/RHHG5J0k4FIKqkvw77Si6WeJo+RKwKgmqdgQYjrG5RfvKCJ6RnrbF/8X6cglBS
	 wweTi5ronU/24iBvQQI9i1l5MCknFNjAEF83Hxuv+7HW3SOj5BQNKRgKZG8jtMgK5f+L9
	 q++4ceVaU4WmFneY78+rlyaQhTI02YGvy5ceh9Fd8WJwzK77MyRgYiz5K8YCSMC6kow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551250;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=UPLVVDAmC8PDn8fCPCfleQnG71yk1pEKS9gObPmVymc=;
	b=y4cBTnKyXY4QBG8q3UdgEFcmmAV3Iym+g9JU4naVqMAH+l45bXDAEiEDpE/2q2Lqm0oi
	 MPtLkGQJhNvIHehhDUkhFKWbiz8t7nZPPYj/7E3aq4bCNdGCRDATtdJDfLSme4LRkExX4
	 fU8Fm5DWaSxFLwViElGUSAFE49XWwqNjQ5NCTTOfV1y85IXkWonB9lWAgitc53KUYx3Ts
	 7f1n3iagKd+e0Q9BSAtSmTaCG5qzbYqHAWItp+yFAMSWyGh1Ol13EPhP8TIsDHWG5wpdV
	 qY9GzWKHJ7Eoqqh0xM40JeX2A0WJoTtBRc7GFWUNFnUmUXj56JZ/KHbBN6UW+4h7Rcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ASSBWlhC;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C5A606A33D
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 20:14:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7C5A606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ASSBWlhC
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cde1479f76fso2847686a12.0
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 12:14:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551249; x=1796156049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UPLVVDAmC8PDn8fCPCfleQnG71yk1pEKS9gObPmVymc=;
        b=gdxKRJHOXZvRYfYZEVN/pZaGBJOikyWVw+tQ4XNicX9if9ZT8efGUMVIkPY3FyAxl1
         NQabTd+f3URjSGtI6Z+p/BnxnnWhHsH/QBGCMthDkEH4QALv8Kdovsa561NeJ6DKJOTV
         2dqBCb7XQ+qKpwNowogyjiB8VRsr4aaPW6vTYanvcDrJ8rs7DCS2fWp4om776p9N5Sb/
         bf3glsGvhPl29QXpA5TXgUXhKtgzNHdgUIoeJv/Wn9k4ngEHKnJw9zRBhmyIiL3uj9OA
         ElgVc4ZvRNxKlyCvUn44hRSyPXmqiMVrS5W2YQgPdvf39LcCRSeTkRpk+w95aZ05cufC
         tFoA==
X-Gm-Message-State: APuU4Z/1YjuvYoHnP9h+17mb0W06YY8wHZ2XvGxoCAk3VE/5z7XW0kue
	BdqErhFlEJTHa7rQPrJqE3AVnFwjLjVVEFVne7cz+dqcKaPWHrRJ3GpaP4xJ17Y4aAte45ALDAj
	tBeRTtYJYYdFTUAD/Unsqh9/NlVw9oE2f9sc6ydeNgaFl2oFAnG6gKXu/fu6PRk9trY0RBumCdR
	AL6KzaZ9tf2WXbIaZQmAORx5x/DWHX5fzftksVT+9zKRFhL5CoZ70cjzR0K0M1eRAbT9Gz+nO9C
	h+vaSuAeMHetDxVvjchf1MYwH48
X-Gm-Gg: AZFdTZf4F6UCWaVndN7NWxPADsTUo8ofx0c13WmTOpcCd1/ldRxsUq6FXleLqYYUZxe
	ioVWh2srkwQ1yj/jOeBj6pcPfVTDmaaqzwvIfgL0KQUlKoTcpikDxVpu0QTtxifXEdQjpaNOgWQ
	xuJYaXhF4NOayY53ftZCxG9Lq3d2ibUHqLYR2G6mr1jaCcNsPPEXqdP7idtWC828tjx+uhh0RYD
	Y4+9WuBwwcXLLroAdwB0QroSb6SFU35oC6eInzzjN1CH8KaQrqoIy4nASMOwl/BJ2sv6IpwKs4X
	1fl+/PfHnnPUL5W/Dui+B0GbLsn0ER2/yuFqhvB9PvZDNOHH+nDqUEQMGGqFciU8c3kyAb9Mzq3
	gAkkTd3/deYLwHHjp4FUzUCT7HTjO1c/+Dn8450DDjTbcCd8G7o8yjaSAmvAcnwWqaFnKArRFUc
	28xzhAKaAOqxtkOcf9e4Gf4B1+bcnK9tJydv3cybA=
X-Received: by 2002:a17:90a:e705:b0:3ad:aa1a:312e with SMTP id 98e67ed59e1d1-3b41c7e127cmr14736723a91.3.1795551249213;
        Tue, 24 Nov 2026 12:14:09 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b40625d66bsm11924312a91.4.2026.11.24.12.14.08
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:14:09 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-92126ecb4b8so86404536d6.3
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 12:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795551248; x=1796156048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UPLVVDAmC8PDn8fCPCfleQnG71yk1pEKS9gObPmVymc=;
        b=ASSBWlhCwEEWaAsLsKUp6eUyencEhh/4goJxt5xV5MalDiz732nbRHzDWrvz/FLn/s
         Yvo+dc7NA1EGZbmnQYeH9r+WF4NKULRZZ+AC5697qBFMQE1vJ6GSLp1g0s5pOHqNO076
         /hvb5gVgoH+ojee16zGdW8F8AMSOLRjFAJ0R4=
X-Received: by 2002:a05:622a:4d43:b0:55c:96a1:b6b2 with SMTP id d75a77b69052e-55d76a6f482mr260166551cf.13.1795551248001;
        Tue, 24 Nov 2026 12:14:08 -0800 (PST)
X-Received: by 2002:a05:622a:4d43:b0:55c:96a1:b6b2 with SMTP id d75a77b69052e-55d76a6f482mr260165941cf.13.1795551247420;
        Tue, 24 Nov 2026 12:14:07 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9213515f467sm141424066d6.41.2026.11.24.12.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:14:06 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH wireless-next 2/7] wifi: brcmsmac: embed modulecb array instead of separate allocation
Date: Tue, 24 Nov 2026 21:13:57 +0100
Message-ID: <20261124201402.3499613-2-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111042554.232998-3-rosenp@gmail.com>
References: <20261111042554.232998-3-rosenp@gmail.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Tue, 10 Nov 2026 20:25:49 -0800, Rosen Penev <rosenp@gmail.com> wrote:
> Replace the separately allocated module callback array with a
> directly embedded fixed-size array in struct brcms_c_info,
> removing one kzalloc()/kfree() pair and its OOM error path.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c | 8 --------
>  drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h | 2 +-
>  2 files changed, 1 insertion(+), 9 deletions(-)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
