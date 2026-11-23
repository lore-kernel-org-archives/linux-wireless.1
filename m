Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795412185;
	b=qrGG3SUggO+/+UD+F1Ab8yEPLBG1njBUCjwXAYZ0esEqai4vrUdjMbR4OQCNXWPNYq1x
	 velu43oEi9MEhqmW8QDn3oxQBlBXth2N1g5AJ+zpbT1ccT+WNo6abE6i5PodINzTNWsTD
	 vofyoku1XYlJGhHdIjP8lllwL1YwoGBFQ5YlDJwS05MD5tPwO336SDod575mHPJgx9cKt
	 91j/2iK24VsfSLxnqLJpiJikYIpTx4hvfrIEgl9aHFVZPyyfFbLyaXS0T84eiesr3TrDw
	 zKuggLzSgneU12hlN50nHBGIhxBXWtls4kcgunihLXIosy0KxBYVWcE20Pu5K5UgG1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795412185;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=O9LBSxVSgrmYoWgGWfbUc8bJ0QKENUdHSqB752eGEqM=;
	b=1ypcGF2DhQGYcdH5wBJt6qV+/kTBBNz2S5O04y0Xt9n/61C6CNvLR442+7yGkgFQQwIk
	 JuI5PJcW4ELgsAxhoS1xCqKXqxBkLwxw5gkj7MczEk21/YWkz1Mncsq6BET4v0LlIvxjk
	 LlTq1KK7SIOenoBwtNcgGxkKd6IJIMmBzGCZCVQ5rWltfh6/cHdnizhjVeQv6K23VT6qd
	 zYcepPYDZIS2wBS3WpDlTvVg/0FMdpBhmm/xoOxnBhIXVpxpTml9t6wsaJnXqb5klMD/b
	 2WamwlNm6tDtj+1yMjESE3vRpzj/ELn4VuNnpf+jHc9/90vcEL3f5yq6QeoA7yGJpeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=justthetip.ca;
	spf=pass smtp.mailfrom=justthetip.ca;
	dkim=pass header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=B55hHfpd;
	arc=none smtp.remote-ip=91.218.175.174
Received: from mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60D8606A31A
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 05:36:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D60D8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=B55hHfpd
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=O9LBSxVSgrmYoWgGWfbUc8bJ0QKENUdHSqB752eGEqM=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795412182; v=1; x=1796016982;
 b=B55hHfpdQ+8CiUoprCvPyd02e9TzuBjfx45UfsJnx69fbq6AU10VssO76QkKYv6D6HMGi8dx
 ISM35GEn+t6aLMPxsGJPzfcewkFFAjH3QRujMANwqh8lyn0+vN7oCMozGJA12xS9Ua/ptnsTRua
 JUd5DDeyTsWcezYn05L5ttbn237Q1q1sR6KoAimQAjKby1Gr0xufImfLBM83CUGzwM69joWkPAE
 N+oDhXpgtj3hxjQV4P1xI9wrndahIsKSb7g5QvEJqz4aLrurnSqozYPPKCzx//h4b0G9CUqGzBW
 vFo53GsMs5vILpH6f1ecQz+SHF+4wV98BKN/ITLCfV1ZQ==
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0a38f794b7c9ff9a;
	Mon, 23 Nov 2026 05:36:22 +0000
X-Mizu-Trace-ID: 0a38f794b7c9ff9a
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>
Cc: linux-wireless@vger.kernel.org,
	johannes@sipsolutions.net
Subject: Re: [PATCH wireless v2 3/4] wifi: mac80211: remove real monitors from the driver on suspend
Date: Sun, 22 Nov 2026 22:36:12 -0700
Message-ID: <20261123053612.81319-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261110185436.2015505-3-nbd@nbd.name>
References: <20261110185436.2015505-1-nbd@nbd.name> <20261110185436.2015505-3-nbd@nbd.name>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 10 Nov 2026 19:54:35 +0100, Felix Fietkau wrote:
> With NO_VIRTUAL_MONITOR, ieee80211_reconfig() adds running monitors to
> the driver on resume, but __ieee80211_suspend() does not remove them.
> Each resume without WoWLAN thus adds an interface that the driver
> already has.

Tested with the rest of the series; details in my reply to 1/4.

Tested-by: Devin Wittmayer <lucid_duck@justthetip.ca>
