Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795477257;
	b=cLnqYOmi2GkmQYvcrgpCZJXinvO9DI27r7dhLOHz5XMdNyiEzLpNVUCPHUffdiGVA+71
	 Q1QGlUIocOFaQE7AxiO8DjQZnKuzRmWW23A8qorhdipFpIrT29rg0vHoWLtRYavHYXdS1
	 8d6905LFZYgjl94EAZtXE2N5E4US8/lONR4kf6Hd1iWBy0u5ilSDZMxAC7Rno+2J+DXT6
	 j38efrKphyFTx9lkjdCVm0FKSg15HMwovECEpZ1mvF1y1Dthzp1mNE+Tu36aP9q+acUU9
	 E4UfeJrm5VNB6NJVk5w7bL0FoXpraX6QCUjoL2YBuOw+S54MgNjkpTZm+C6LYuoL97A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477257;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=3HojZ9LpVYk+EaEbek6rtnOZZ9lGu8QqE5B+74nGxs0=;
	b=SOwPw63w/fL2JL36xPkX+zdxs78Ue0cZNCYry5ZUYplzcYfEURW+AKrB469fhkNth/Oe
	 tgOPOKM6EebSBxMuUtbfdHjlAhoCBd2bc3iiuWb0NneLkYEOw3S4ViSCdHUoxi4e2reKs
	 19Wd/0EEQEZjQC+WnxWHFMPCYarmug3W3WOO4GEXlbzVZKj5FUWzNoR6knkcGGZkw+mmk
	 AqA5h4sOIlf5sv/xxhX2XqsHSkB8wHRl877pC/I3TPBaP+QZWuwRAR/xS26nR0qV0qwK5
	 wUT5KGJPdAjs6xCND2H/BwnQzEHS6rABRZtkvBTowaHMA2cr7AclRx9m7d/gEzK6vEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=morsemicro.com;
	spf=pass smtp.mailfrom=morsemicro.com;
	dkim=pass header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EcJNjE8I;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB74C606A322
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 23:40:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB74C606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EcJNjE8I
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdd9d0c9bbdso2178574a12.1
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 15:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=morsemicro-com.20260707.gappssmtp.com; s=20260707; t=1795477256; x=1796082056; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3HojZ9LpVYk+EaEbek6rtnOZZ9lGu8QqE5B+74nGxs0=;
        b=EcJNjE8IXRBcGjKCwKjvUcw5G5Nn7/EynpZU0SjQFHiO89Sd4OWYCmVyI1p8F0KGQn
         Xrzv8zFJAqIundGy0wrWqECU9k3IsGMuOGx0Qjz19NfJlDUDZSMZo8mHAtSqKGTdli8v
         in3WxYmrTe8Um8PiGty5HFQYlBeaJF7g5an4ANNR7jfKn+f8BRLiorqhQB8HJ4yQdPxS
         z3OkFPo/Cqt5v/ZJSGLNfyCvX962guIyxI6zdiHvPHz+ez3JGT8iPudO0cQbOj98N7Mr
         ZQyMbJ2S/t3DHcavl5yL0fmFuXCLcbqHJCOLf8z69uW7O+3zzoPPW+CEGv794UvvOzgK
         HRdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795477256; x=1796082056;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3HojZ9LpVYk+EaEbek6rtnOZZ9lGu8QqE5B+74nGxs0=;
        b=Sn+XvHQF48RgT0NwRmIw82n4oau0BRRteqM8jm1iyk5WZiRKYOAZqMjaLRdNWjfikL
         Ah0O6qKMS6+T5eULqeAToyEYY6SaxpfoonsQoKPLwPhYwPG0J+zDtcUUn8krEJmVjt1T
         DA/+PifC3jpTmjrh9uJfS8Ufp+v6/A1oOsdSogt2EyCsIWOJLmeBf8Um+nzA6UAcRb32
         /Qqycw7xa10bK08h7nAvrVTErsZDFMYTLp5Pci0qT1/do8fGwhujkiOYvydv0bOKdlDc
         bytDzVOJzBTR/xvmNpBefhqU+/QYBa4jT9k6uy8RzYqhefV549h0zmkPqHhHhvREfiVk
         SemQ==
X-Forwarded-Encrypted: i=1; AL+hErGKxFwa0pcScXkGjy5kOM6waWBXZcID4iA5jOrKN8yG5JVdNETHUN4m/JpaJAnupdFF0ZFZpZ0eypJG+YK4Zg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9lnh9qSHsRekh8PIL+JmLxS3jPEL1jHWRWf6Uc0UNarpxd1Coq
	c9goAxijSrSKRjASClAlEICi3pLVUfS4gbtFdLqJYtdAOsBWpt8vnMkRyr84lPA8Q9w=
X-Gm-Gg: AZFdTZeeKzgc5UK5Wvyx+gcQyyhxGRk+vwq5HCGCNhfyOqxfgFOfT65qfm4l0gj8/hm
	aOVoWvehHJlDRgVe1pcH+968p8h8F9jB4gdhmOhKLm0wkqmgM0hLhLwgPvcZWvwQCYrwrlWEPhX
	bFPH3Z7x4rupvTss2w8SSGnSdnapWoeGZiRxFv28yVA1Jmlcv7uBSy0MvejjIKoecwFNruFl+5y
	tN65Y7/iUrvP+nenMr+8R+u/3TWuQcwpha7tb0RgfwXZo7I4nKtwL0AKBF39jpIImD4Qct3nvu2
	x6B3+xw6IQ44POMMkeiWD4NDFQ/KTR9u2u675PqPrdR1kn/H4wf4UR6ZFBSxYYu+ZqJ6w/PWc5l
	y/2RzIyiCJ791JtyJOy07XI6DCKmDBwkMy6B3CUb0Nm9TLcw1DMjZLZZV5ExKEBpSsImiGWC6lU
	9HV4L/MoCEdviiNb6/fbdck1YoSX5EI1Ag2vdjH/R1jETYUU0XaaSVgld1gXwWsinIy/eVyVr+z
	12eRFR3WKYZ9yyAfHiZDpKEfuRVu4lE4gokcjwUTgMIfxqXKOAuiyLG4PKDway6jwaSnGoSxP54
	T+cZQBJt/ImncnVEYrkMGGxlc9dXBRFsI4Q7xFnUFodGTVtWGyAWNdlEtoFkHkseYLJjOBp82AA
	Jx2mZJLl2rYajwICM4Gp6ve0BpQ==
X-Received: by 2002:a17:90b:278c:b0:3b3:bd07:6646 with SMTP id 98e67ed59e1d1-3b41c97ac3dmr12156450a91.52.1795477256132;
        Mon, 23 Nov 2026 15:40:56 -0800 (PST)
Received: from localhost (60-242-93-14.static.tpgi.com.au. [60.242.93.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad48786sm20170750a91.9.2026.11.23.15.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:40:55 -0800 (PST)
Date: Tue, 24 Nov 2026 10:40:53 +1100
From: Lachlan Hodges <lachlan.hodges@morsemicro.com>
To: guohongyu <guohongyu@cmss.chinamobile.com>
Cc: dan.callaghan@morsemicro.com, arien.judge@morsemicro.com, 
	johannes@sipsolutions.net, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	13057616121@163.com
Subject: Re: [PATCH v2 2/2] wifi: mm81x: bound disabled-channel loop to the
 allocated response
Message-ID: <yfxyvklmyq4cglvydogqkoiqsgjvjqy6qhelu2xbxtzgh47zmg@tlfytt2dgncv>
References: <20261117032227.154874-1-guohongyu@cmss.chinamobile.com>
 <20261120064905.192045-1-guohongyu@cmss.chinamobile.com>
 <20261120064905.192045-2-guohongyu@cmss.chinamobile.com>
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
In-Reply-To: <20261120064905.192045-2-guohongyu@cmss.chinamobile.com>

On Fri, Nov 20, 2026 at 02:49:05PM +0800, guohongyu wrote:
> mm81x_mac_check_fw_disabled_chans() allocates a response buffer sized
> for ARRAY_SIZE(mors_s1ghz_channels) (26) channel entries plus the
> fixed header, but then iterates the entries with the firmware-provided
> count alone:
> 
> 	for (i = 0; i < le32_to_cpu(resp->n_channels); i++) {
> 		struct host_cmd_disabled_channel_entry *entry =
> 			&resp->channels[i];
> 
> n_channels is a __le32 filled by the firmware response and is not
> validated against the buffer size in any way.  A firmware that reports
> more than 26 channels makes the loop read past the end of the
> kzalloc()ed buffer into adjacent heap memory and interpret it as
> channel entries.
> 
> Bound the loop to the number of entries the buffer was actually
> allocated for.
> 
> Fixes: b1906cea00b0 ("wifi: mm81x: add mm81x Wi-Fi HaLow driver")
> Signed-off-by: guohongyu <guohongyu@cmss.chinamobile.com>

Same as other patch, this has been fixed ad130fe51691 ("wifi: mm81x:
validate n_channels in disabled channels response").

pw-bot: rejected
