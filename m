Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794220511;
	b=FXyYTE8Wz7C6Iigj76ujH8Y1ZOaHp/VkfGinuOHloqDmNE33qbPY67BOsC+IFDx89uGd
	 8bxxL+ngVu7lO1c1gz1Dxjl2riugPF881craQ++SO8i8EThR7jsIsw+MX+e5Fd9ZimFOw
	 HMCCpCHh+NTbvnLlGWRjqPzU8ZtEQLbMsoGsj/QFS5VvXoS2O3+GINkWO1ZIvMPRMlKzs
	 eGfuPU2yar8dsuTDKWB28r3EbDPttF5Ht5zD9yqR0shjui8riq8u0jwea99DO8s0zKdjh
	 IUmU6SCo6oUxa85Ijr+PE/r1WSTJARFUBJInw9YAwZABDjrLZCiupVL5DCiJlIWlx6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794220511;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=781MGkUds9I/CI1+UP2+HKzeCqNjF5wPmk1nWC+RDLw=;
	b=1AHs3GNv7jp8U3AUdy5ItrzyFJgcjgJL+WFeUpaWBwv5LBvtiThStEuqeywtWlFDYJ9f
	 NX9tMlIVR7pULYky2GNLR4gR6+13a1Ds9G+mTr0nxRqHc60I8G0HvShkKcvivJwUKWd96
	 e6gwzlzpHz0lEyhhOetDYizrDxpP6XE7liLlqQxG//YnqA98JKTvHrxc6pX7s1l4/YU6b
	 eDPrv67ordslYUPhufePb8oNeqmJS9Dgqht9d1gNiKGhcqFq+4T0VRZSZJ0M+glPbteNw
	 R1IoOWo4jmG5PN9RjdKFSciYQT2LndZvBIsP55pQHp9ITvX/sUkSzpRHj2tf7oTMOQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=modelmiser.com;
	spf=pass smtp.mailfrom=modelmiser.com;
	arc=none smtp.remote-ip=109.224.244.119
Received: from mail-244119.protonmail.ch (mail-244119.protonmail.ch [109.224.244.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8585C606A332
	for <linux-wireless@vger.kernel.org>; Mon,  9 Nov 2026 10:35:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8585C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=modelmiser.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=modelmiser.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=modelmiser.com;
	s=protonmail; t=1794220498; x=1794479698;
	bh=781MGkUds9I/CI1+UP2+HKzeCqNjF5wPmk1nWC+RDLw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=OyMtypEJGoKtINe2AEHBQiUCtjzZr1LAavt9y3jZ7fzBv6McX5oIPNPG4p9KHaCbN
	 uPCnvGaSA3bfeZzk/abBEtju0obqeUD6tkEcPDmsKhTqWSbrNeuNnnTmhWG/Bo+Vdy
	 LRDZuJNmkmwXh1PQvjvdZMugKhjS1788YhaL4cQn5LPJwnWTDeiM5xZJZnm1rWzFB8
	 08YG2lt3HnHUYYTnx2DqgcrpqkaeHAIVeWYjQp07d7qqqE5KzYWOP8QxrPJ1fnzFEZ
	 YQGfjWmVmTRbb1wSJJkBnuitC61Z9DBbWmDLwydvy5xb4s1jqx/1QRK8YhYJMpZXkd
	 nc5PCFE/lldXg==
Date: Mon, 09 Nov 2026 10:34:51 +0000
To: Farhad Alemi <farhad.alemi@berkeley.edu>
From: Chad Aldreda <ca@modelmiser.com>
Cc: =?utf-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>, Jeff Johnson <jjohnson@kernel.org>, falemi@asu.edu, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] ath9k_htc_tx_cleanup_timer -- ODEBUG free-active-timer and use-after-free on USB unplug
Message-ID: <20261109103444.381459-2-ca@modelmiser.com>
In-Reply-To: <CA+0ovCgiXX28Mdyu5xA4mDU2pPwoByEzEKgLn5JnfapEKg+PmA@mail.gmail.com>
References: <CA+0ovCgiXX28Mdyu5xA4mDU2pPwoByEzEKgLn5JnfapEKg+PmA@mail.gmail.com>
Feedback-ID: 232753253:user:proton
X-Pm-Message-ID: d3056e397a153c22841cac1e7ebcd25d4381a482
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Farhad,

Could you share the reproducer for this one?

Two paths in the code would fit the report. Both end the same way:
the timer re-arms itself (ath9k_htc_tx_cleanup_timer()), and nothing
deletes it before ath9k_htc_disconnect_device() frees the hw.

1. ath9k_fatal_work() calls ath9k_htc_reset(), which re-arms
   tx.cleanup_timer without checking ATH_OP_INVALID. A WMI_FATAL_EVENTID
   (or beacon-stuck SWBA) that arrives after ath9k_htc_stop() has
   finished still queues fatal_work, since WMI events are processed
   until ath9k_stop_wmi(). The timer is then armed on a stopped device,
   and ieee80211_unregister_hw() does not call stop again.

2. Inside ath9k_htc_stop(), the timer is deleted and priv->mutex is
   dropped before cancel_work_sync(&priv->fatal_work). A fatal_work
   already waiting on the mutex runs the reset in that gap and re-arms
   the timer.

I'd like to know which one your reproducer hits before proposing a
fix. Does it send WMI_FATAL_EVENTID (or let beacons go stuck in
AP/IBSS/mesh mode), and is the interface up or down when it does?

The code reading above was done with an AI assistant (Claude). Nothing
has been tested yet.

Thanks,
Chad

