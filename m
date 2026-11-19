Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107735;
	b=dHfHG9/RteXR1754E7oC7v9lE1YYfmK9jqxKZUsAr0sWAKoLxYP+ZcIEipOP+svXCFnp
	 qCkj4R2ej9mxDdHaE8Pkz19z7KhoAh2RHWBeOV04n8FYy1Ny9IQsNvcNMrbh3zKK5boC7
	 tHTYDdTvZYevE8VkebUSRd57rLWvCMvbZuUtm/fK2TDyHPDzIUgT5d4ynTHANSFDWEAjL
	 KJsQsNf3avEwVB707lReIzfpsiSY5ue9b7GIkGNWHbOu3pOPzX04vcAL7QR72T/kfR7s9
	 V9Ou+xuWh/S531afsrtmFCprv8dxBh6HHV8b+XRDPuhweGX/WxWkOVQPnSOw3ne4QHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=TTmdANK+IkLy05CsjTQ6pOkhGNqqFqWM2skfBKcModw=;
	b=saaMgbVHc0U3N4BOcZZtWuJ9U3UoZQi9q6/CdOxhKDG52E2/IgESEz3i0/JBcQtDk8Gi
	 XFW4hmmztRjc66WQBCsbmHLwNova813heUvxENwlYu6rpK3wuDagxtHPQ54DDuPbz4VPg
	 fKNQe1bVa7piIRs/QvHvvRLMh/eFK4dHWDTMf9rzPDjvyUoc3hwOd5d6W9NcOE+w731oG
	 S/GIvsvfGyXKAyloz+VZOfFHXvi4VxwP5EOhQp90NVNS9gsfHFeeGF6lvGMv/DnCsHCav
	 XOvJOZq7z2XkVdejS0/94b4gEfbYDNGPXDeO1kNDxJMO9Q1rYywqwmOuYWmMD6eMuSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=awkN7fJb;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED762606A324
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 17:02:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED762606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=awkN7fJb
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36dbde64409so4271456eec.0
        for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 09:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795107734; x=1795712534; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TTmdANK+IkLy05CsjTQ6pOkhGNqqFqWM2skfBKcModw=;
        b=awkN7fJb9l5fbunrhGLkjVO+98j2MYJVNiuo9hSQanF7wgXY+sVEh19TZPXGfHgiKz
         wIMV5qb2hgT9ipUtvHENcHj8lsSd16Ee+M6Qi3cyXdAGwe7oIfhpJg65un1DogjOBuVb
         k5b2wwaLPZkHr3ChWRg3Z5Y1Nhtsfo2MVIOAuumg/YLPWsD5Y+XJZmyACmLzdA1ONn93
         0JSMz0gniTZRfI40AQ8qm0IJl3dv55rDG/b/rOJvCTQVANQFj4cULvHF3DTwVZHhkGE/
         hwfB3R1MSmSVrMtlH1rVPh9/xculp9zZo+aEMpDPgMgYx9cTLqfkeMz4R6I3Q+MeC+VQ
         eEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107734; x=1795712534;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TTmdANK+IkLy05CsjTQ6pOkhGNqqFqWM2skfBKcModw=;
        b=U3IMvFlWSIKqAS6g3z9Jzbz/Ozk4eu/lcPkW383M7/B8kkw4ScFa0dw89FVFyvKd6/
         zghCXa6fud21nEpt5Kb3yUAg5fGvke9W2EbGrzD+K63xnWOZR5coF/YDPGtuI8pH09OT
         dknRz0eh+mJFHvv+iaNDIvyV6EWgizV2/plItJIGCLDuZUpvb0JOW+Z1wMtcLC9AkRyn
         449NIMi8QBYwOnGWvei+rD+zITdM1dMIWQ+B9sv0mEBOa6xjRwlktq1/FRsgM3TQ9ueL
         6VS3MP1sh3wWn1MFIvEg4TRTA9Mp+dYnQuClM1+dhJYf+ITfkGSMndROrsEvinjwXAVd
         TkNQ==
X-Gm-Message-State: APuU4Z9XoBNXzwhotOPJiqjoWHdS4ebcpRq43uSH2emWP4bHDZQX/RiH
	/FXrN5bM8OJpuyFYrbiCO5zKVfPhXWYftaQNaD+P2mc6In6OWoV6GmW1
X-Gm-Gg: AZFdTZfrGuzZTdPpJ3QSRhHr9/q7zphI9A9rAdK/u3rz2jR5EemnSQPggn/dK3mltI+
	Wz5T7368oZu8wbBhaL6gQL/bBQmIRpW2oyN10Fl2VkDo/7PvjrknXEUgYfE97X9t9p5NMNZTvFs
	JrErA8f89wd9NYNXZitv6sHcLgVkGu3GRvbCQQOrFoNtsSJxX5cZGmgYiQ6Mf475c0LkEPL5+ZC
	J0spSxb6tcM96SpkhPyfLKrMGcBpEQkImd07f2EEuhiPzen7wRE/DAYbLTAbip3O5svdsOKDVP2
	vUztkrGx1YarFHbFPxAmcAw+n1hP/Yb5rZAQf2YbelY5HYwfF2j1cHTM0jnqJFfI9rYbiCJTq0Z
	gZtANi9p4y8m0aiPMCEEDFXe6Sx+3GCoI2WBK9DSLGzT4ZIQDeAoEjDNnC8ZFpLM6SMgIrnrYm2
	sXeqiqDBPpbIwglgRWI7ccS9nFwSarqB089wIX1cLycj+L1FIiMoQsfe7wmMpr6VlFdmJpH74fu
	TJhaxTEBafbeuEva0GNaqROWCo4YbYZtD8DMt2khsN8hPUFPJyeQlnzUKDsM4K67EbFbJdiGNMA
	YX2ZND+ZolQy+DiCgWxxijoB9/peNtK2
X-Received: by 2002:a05:7301:db86:b0:384:d59d:199c with SMTP id 5a478bee46e88-3856c2c3fd0mr10608eec.1.1795107733537;
        Thu, 19 Nov 2026 09:02:13 -0800 (PST)
Received: from embed-PC ([2406:b400:d4:2c10:2a65:1948:5abb:65a2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm138922eec.12.2026.11.19.09.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:02:12 -0800 (PST)
Date: Thu, 19 Nov 2026 22:32:07 +0530
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: rtw89: 8852au: Add support for Mercusys MA72XH
Message-ID: <av8rj6mBU8i5vA5A@embed-PC>
References: <20260710030055.57438-1-abhishektamboli9@gmail.com>
 <9bfdb983981d4bb98a4692ac6f1711f6@realtek.com>
 <8fb9ced500144618b7f43e54c12a25ff@realtek.com>
 <av5ztQNkWSsLE4NA@embed-PC>
 <9a88c5da71314ce7ad7100d1c3e94a03@realtek.com>
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
In-Reply-To: <9a88c5da71314ce7ad7100d1c3e94a03@realtek.com>

On Thu, Nov 19, 2026 at 05:22:09AM +0000, Ping-Ke Shih wrote:
> Abhishek Tamboli <abhishektamboli9@gmail.com> wrote:
> > > > >
> > > > > Link: https://bugzilla.kernel.org/show_bug.cgi?id=221738
> 
> So you think I can merge this patch, right?
Yes, I think it's fine to merge.
