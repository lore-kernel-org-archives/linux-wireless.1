Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794277106;
	b=RGVRLhb6WQFyMysDkvtOvIbm6CDewNyUi6LTUhmV4Dm+7d16oeqfZSe1TxoPf1TAyHZo
	 Rr061EoKrZdlUJtHmJCQCuPaVMaOEU+nsr220jP63VVvVwF5pJ6QXMjy2/Jtb7vewq7Oo
	 q2JSg1EuDtqYfwilvqgK3XuYm3x7Kx4h88fOfRX0evZCDi3+yF13S8ppgw5vr8njD1B0f
	 7SBw8xWVn2GVJNqiE0xjXDNC6LjrIv5vh+qELBMUYM6fjHM1zZDSOBZ5OnS9+m5O7emJs
	 LkqvJV+Jv0we1QejIkPF9UIoTY99tWmNEV/S5iXgV0lhR5l8pIuxOXS4g+fnqWl68CA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794277106;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=hhX/taozD8h2sfx0V2EzqRbzxnyILAwgPgnGX8OF0yo=;
	b=ckP8cWWRWmR7HJ9vlsay7bt/BGIFBxrLCNTPi6opZ8z1/j1CXWxb4zcjNTiovoEFqFXR
	 SC0Q+ySIlwALzK06w3F+09Gdp28b4llRbRQQzWk/3+EkhLvFOzBtSbyt1wEtmp+4rTXXv
	 n/tIQbwhzoeBb2sZ50IvxrJlL83RbOdXnl+wBUrzt1P//lFRbVXmrC/iYZ2qwoY4ClNmy
	 kYOMKmjR23is+JVB4G3QOFuj9nWhOyuULqXrAaOBn+ETTwKSRZnQL9CDvypRibjlJdVkJ
	 CnTv82txZlKqb/KMRjyupMYopJiHefAeVrqKqVPfEu6HUwxv74Xc1+xPOMPeWxenfXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QeEUt7xp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.174
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D210606A321
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 02:18:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D210606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QeEUt7xp
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5ecd9a400cbso839101e0c.0
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 18:18:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794277105; cv=none;
        d=google.com; s=arc-20260327;
        b=jEj4Q64ZzY8pAdYjNZ9VMhHu2apLZiQkaSGXzrqP8s3sHG0GFqrNECoPZoW7J2W6Qs
         ve6svPkNYN9qr4vz9PwENwUxIQAF0LgI6g+AeI+ESkVi+h6CTewvedGMQ6USanMEPqa7
         FMGZk1zG79rzMdigdBd/+bzscsTolZhzwrwi6wKSQHlb7qcqGR/244sk8+6q0kba2vOw
         6o2ZBmD5yKlKdcxL1YgnKs/qa5+lxyqmh5FzxwgkIrNtEBurNWXk9QO2XnwPMb7kIH6e
         UU8IW9DuqaUWPbRgYM9JyDLjr/HgqYhJwFwX0CWnqn7zjzIiit8G1wZZDKZgeoQZOqOB
         U/vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hhX/taozD8h2sfx0V2EzqRbzxnyILAwgPgnGX8OF0yo=;
        fh=2ReaoeL9OXsVbxMCIcayAkfXExiSj1w0iyF6TIS5CIg=;
        b=o7QA69KaSc0avZe5rxlNmN2yqFOhELGIyBa6TfLFM+WKQFpWZ0V7JPGNgE7cHyrwGL
         JG3MMfTru1kehbnnBCs8Hyf2eDtUXAGH9uVNzkz66gbmMYkwRys6BU5kusG9x+R6jS97
         iBN5CViat/xt0oDPA6UCngGUrbAJ0AJUUPjAb1k0KJWsyW1JphXQmFN+e1t5mgqulEjR
         32+cFGkMBPCjFL2w+BqifduIFomEql3YXRNWlg8RcOxauPvi7GyIOuoNmnIBSxhzYMyk
         1kNqZF6F3vQ7vs163eEc63MJfa5I36SBAn95d+inJwp1gU8QtwhrgvLLcx5OUuu3xNix
         HbIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794277105; x=1794881905; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hhX/taozD8h2sfx0V2EzqRbzxnyILAwgPgnGX8OF0yo=;
        b=QeEUt7xpf7VR/rxl/W9pU84ueuL4wvvRMzAD1Zz2Q+mpdBFJs5e1AqIitt/AUdLT9j
         tus7ZsU93P8DSj/zAsD3VrumRs2wiiAPKuF35Q5o2BowVVenUmyJMWkaVTrNlDZuv7/K
         aIaiwxo5wo62AEGXUKLt9cMZ50KX8ZziQLBE8potmgjCPwnNmxVvtkPEcyTFReCnrUhZ
         DA7roTmlxOVFT9AXAXjJSYNm6st4nUySWx3OMzcqeTeLSwQ4/CXX65vjyQZ4EHj84yDs
         nGbMk6Oe+Mx4CXUsLMOgLq7r4aFHMO7TujBeyo3ZG7qaAx075tkmBGIYw0sTzn+LbegE
         Z3eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794277105; x=1794881905;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hhX/taozD8h2sfx0V2EzqRbzxnyILAwgPgnGX8OF0yo=;
        b=D27GMSiapDtiJDfRejyoDgGUKThtzdazfzVEvovZY2qSPRaR1JXhRq1FaPLgRbTA7a
         aKQc4Vp3ZOM4d5Saemvy2yyHPuo7hwx6ybAaxOnykaeC5+QYDuVZ5L1MO75Xduij6PRs
         zQl/BNgD9cCAqUmATYrjUjXA3oh5ns+aFNK9bfvsDJIkcaxDWIfgdt18ZexhsOO1ugXI
         HQwWTz6axFzA5X8NGi8ky9+VFWX4hDOO2FuIyov619F4iwlL2o1nzXflWs3adSDrNXr0
         y89unnjETZH7Y4eORmuBEUPuznKed80biJHSiqLZs9SL47z+cGru5qtHRgIkkLTyD4Qq
         Kg5A==
X-Gm-Message-State: APuU4Z98rf0qYi/bzYfKZCmENLEbJcgBDIm+ORMjKIH70PFh0eFkeBHc
	7Itp8c8UI6wTZIwWYAxEMmv8GeficIJ4CHN0+/iybuj3oxiBxJ4thGimPewxJzmncu90qWNpXQn
	vvWYlrwsJ+RXhXRwaRocfRgUOvQByOO7TDG9+
X-Gm-Gg: AYBFou2/mOcfQYXdUttdXo2tV/+5XLG4Pd0canhgIAIaavS1aJTJ9rTJ70SIV1KDJIV
	4iT964OfJz9WBrDFoihdV+CiQodgpAbyv8hQiEUnGmUF8KxVsAOZeLNibfcsYn8S/Jbw9GI4mZ8
	9kv6W9kF/8ZYX6+2sx0iB+ZlkekwYbT1q+rRasgi9wCpSi8q2KNjTSchcbNjnw/SItb4Skv61N7
	idGtUfC0uLQWJnqu56tDMpeYW+5qVKFsETtgVEFEJjuTUmaTM/o6dJKT7Taz76wlMTFBo7WPCn5
	sXk4vYRjEbwIQjupBF/NBhT8fZ/MC4DJX/7wvcNS27xrFlhE9ks06rHl8n+jmRD+V5bUpcanlyD
	0uEwwAiT9Qs3noMKys3uj866hiCxBIas4x39ip7+ohGm+z63UOnqBE/orfgPaZKGGVe2D/BkZih
	b6SJBWkBehMFR7xNxn
X-Received: by 2002:a05:6122:469a:b0:5ea:f399:781d with SMTP id
 71dfb90a1353d-5ee0d1d05c8mr384452e0c.23.1794277105142; Mon, 09 Nov 2026
 18:18:25 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108-ath11k-tx-airtime-v1-0-f1a02b2372d4@gmail.com>
In-Reply-To: <20261108-ath11k-tx-airtime-v1-0-f1a02b2372d4@gmail.com>
From: Christopher Griffin <christophergriffin05@gmail.com>
Date: Mon, 9 Nov 2026 20:18:13 -0600
X-Gm-Features: AclHuK9uu4Zt4AmknOEeRBG3AMABDQ7pzydp1LGIC-VkddAQ1RAQ1A1MKWWaYa8
Message-ID: <CAKobHXA5QnH+1APCD6rL-yS4LvSO5y90wEjk6Sz_uYhmfv2wmQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] wifi: ath11k: feed mac80211's airtime fairness
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	linux-kernel@vger.kernel.org, julius@bairaktaris.de
Content-Type: text/plain; charset="UTF-8"

Jeff,

Please drop this series. Julius Bairaktaris posted the same two
changes three weeks earlier, as patches 1 and 4 of "wifi: ath11k:
airtime queue limits, airtime fairness and a driver TXQ scheduler"
v5:

https://lore.kernel.org/all/20261018174904.1757161-1-julius@bairaktaris.de/

I missed it when I searched before sending; sorry for the noise. I've
tested his series on IPQ8074 and QCN9074 and replied to it with the
numbers.

Christopher
