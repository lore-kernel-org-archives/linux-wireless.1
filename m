Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595874;
	b=h+6QuacHuifa2E2iQ9vmEnYn35bX3t+OKStUG02R3k7AV/JDA+h6KQtw1nIDJvNPXVpC
	 GYdT+wQWjBsCHY8ymeg5uZirYqr8vj2WpUdZ4WxHolVMzYevhP6xpyCWuXOXuVl5TXEDm
	 LP9gaoz9Cz/PLtFbZD+mAM/haqurQ1YcKUSSc5eK6L7fbQ/KQtCF6mbzBdpDDObQyzSOo
	 xin4ZOt7vO28j4rIpQRzIg7kazW4BtJEFZb+NE6029dPxqwCu8mYLHk7AW/4I5Sr0pQk8
	 d8VTWfkfKlzHxaeZJNEaXygT4U8ZTvmL0IlpBT/Ay+CzLCGn3BLZ0P/tyPiuafKjafQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+TRZdNZZTPPkMYVRkJVudPNvzsjpKfkzzbnnqihNlcQ=;
	b=01s1tnyYRgS4lpLjHJsIPjgUkGIy8ew1IxSQPID30tIS0GRz0Xldxy0kCY8hb7NA8LID
	 PAOiFmw/4fzxIKdnREzcH0gQumTYqgsOEfhak+HotOvJdrSDiRGSn8irxBtGIJScD1XIo
	 rHUFHYzMCnwJFej1riLOJwaemkMBPc2IajG5I35XmQ0czuEwrJOQJXNKatihpA1/OvHDv
	 yWdYqOdIofwc60IUpOgQR1lWLyzWMi2FESk0S4sq3AZZL7EFExTPZAarlPi7y4r98H0iP
	 FgG90jOn/b5fXUBo86k3vtjw7NB/UwlzK4YJCZZhx9EH9k3UnXMzsbSzqrDIhSoDf0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ggD6QSUT;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F7F606A32C
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 08:37:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2F7F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ggD6QSUT
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso11785584eec.0
        for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 00:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795595873; x=1796200673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+TRZdNZZTPPkMYVRkJVudPNvzsjpKfkzzbnnqihNlcQ=;
        b=ggD6QSUTg+qpItvfGL5NHWzDWWQqs7SZdUfoYTGIdBHctNIWGx3BsMQVb3NHGeY5BS
         auhy//rjg/Z6yWkAynOI4RaRUDB0bTSzq3kIi1yPCJBwWGV3z7RM+3zE5nNP63EOE5sv
         gO2JT9Wagu/ko45u/lGi3rUMoBFQSvUf58EbTtmCg9n2oI3HcH9CpWfTkAApvjbOK+Gf
         7FK1EwzzXzeBZbGgWol19rI7cCdIGiv5gEQvlN401suhaAvbzcZLi9twvHn0W/QA3Owd
         03kkT4cgH5zLOLoN4YWM5yV0GOlzV5wPgi2l/GqS4MByY/Ubyp9KDvmyiN4SCm3crnuS
         HzNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795595873; x=1796200673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+TRZdNZZTPPkMYVRkJVudPNvzsjpKfkzzbnnqihNlcQ=;
        b=teKFKeOqzU58b0ZX4G4b4e2xHKyPa6liL9Wx8Zg9TeJp6WgSvxCPwFTb0suE1edQIo
         Ik8DWYddtI5oJur8SeQYcKi+/f7qQdUw/7LXl8BJzw6MpUIOLvRZqnJzKYqMhNsTkayz
         yqowwcuf/wHf8PeCtVFL8Ky/WnLS4z08QyBAoest04ZimAFWWm2AQvVFgYfbNBboRLEK
         eL6LBWwGvCfqzuO9aoxMOIsP3VgmvwPPYcucFIpEAsMN+pkWIHFFlvgGv04Yv8ClmQ7N
         NByUYTLSaC2GWgP2KcCTkGz4Ll9+7qnrAxARwNBznToNMnzSfZcV6NxyEwzc9xEFVm2m
         LLNQ==
X-Gm-Message-State: APuU4Z8LZw5P2jTecp6q8EkmxaxTyKQtskCMgpH7m2jwuZedP9+BQqPI
	1ILdg1nMUNpZsyfcQVhVNUhxhxcx6bGqaPOdFPWmjufW1t04k51UoaPIHAqGxw==
X-Gm-Gg: AZFdTZdq6tIEm1o//piZQ8naf8gNPGUKfLeSbEOTNrbl6CG57rPdBPECDw3nrml0XAR
	OGoiEOPV9latcB0+PHh9GNYLvonMnRQpyQ0/L4dvOzyyfRnFrmuo3fZn7e6+V3l72wBePgnR7Ux
	tiubKWbm/gDw/+2OqXdgexTwtxzkqj9656hvB9fNMq+vyae8DEiSVZBJcuxypoX4n9lAbDESuVR
	U3+f88JF1lLi22J73PfxFttZsOYpJVnfGdXT3t96gcSSGeLAQG/Vb/X7esZK7F03xxm9TwyIF/P
	Off/XYjfY4Hyzoq3HbqVWfYBCAANdYyNzQURDUqGGeOy5z9Fi/K5a1didj8dGAetlrR8Yp4S2kq
	ZCbkB0hgKOMeDsH1zbFBMUPg6bwRawuNOCJJbsbiKNfJ1fAtFRfdAchQ37qGR8rR3HbEoengSRm
	9If2FJVm1CBpMesFXCY3u0GfkIrnhRFgV0iFS8yHk/VMYRvPpjEZMe0ZpUtwU+2YFvJzAYravJ6
	w78iC+n+dT8FscmbQ0U4Q5bU2HFtT39GxpuncJhGFIcGO/892vQZoEahGK1/+wV9ZwYZU3O1b83
	HO2p+QHsAy5q+rDGdDGYYR7yJjPPhOCCb7oMSEXejGNLbY9bgLCHjg==
X-Received: by 2002:a05:7300:d941:b0:381:3a24:1be2 with SMTP id 5a478bee46e88-3856fd5d566mr18982628eec.13.1795595872676;
        Wed, 25 Nov 2026 00:37:52 -0800 (PST)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3866f299d0bsm43927422eec.19.2026.11.25.00.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:37:52 -0800 (PST)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH iwlwifi-next 4/4] wifi: iwlwifi: pcie: validate txq_id in reclaim
Date: Wed, 25 Nov 2026 16:37:42 +0800
Message-Id: <20261125083742.1355074-5-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125083742.1355074-1-maoyixie.tju@gmail.com>
References: <20261125083742.1355074-1-maoyixie.tju@gmail.com>
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

iwl_pcie_reclaim() indexes trans_pcie->txqs.txq[] with a 16-bit queue
number that mvm takes unchecked from TX responses, BA notifications
and flush responses. A queue number of 512 or more reads past the
array.

Add a range check against num_of_queues with IWL_FW_CHECK() before the
access.

Found with a CodeQL-based static analysis tool.
Reproduced with a TX response in a userspace harness under
AddressSanitizer and UBSan. Not tested on hardware.

Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
I used an LLM to help write the harness and this patch.

 drivers/net/wireless/intel/iwlwifi/pcie/tx.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/tx.c b/drivers/net/wireless/intel/iwlwifi/pcie/tx.c
index 0c29fb6b9ca7..48165a40e2cc 100644
--- a/drivers/net/wireless/intel/iwlwifi/pcie/tx.c
+++ b/drivers/net/wireless/intel/iwlwifi/pcie/tx.c
@@ -2364,14 +2364,21 @@ void iwl_pcie_reclaim(struct iwl_trans *trans, int txq_id, int ssn,
 		      struct sk_buff_head *skbs, bool is_flush)
 {
 	struct iwl_trans_pcie *trans_pcie = IWL_TRANS_GET_PCIE_TRANS(trans);
-	struct iwl_txq *txq = trans_pcie->txqs.txq[txq_id];
+	struct iwl_txq *txq;
 	int tfd_num, read_ptr, last_to_free;
 	int txq_read_ptr, txq_write_ptr;
 
+	if (IWL_FW_CHECK(trans,
+			 txq_id < 0 ||
+			 txq_id >= trans->mac_cfg->base->num_of_queues,
+			 "queue %d out of range\n", txq_id))
+		return;
+
 	/* This function is not meant to release cmd queue*/
 	if (WARN_ON(txq_id == trans->conf.cmd_queue))
 		return;
 
+	txq = trans_pcie->txqs.txq[txq_id];
 	if (WARN_ON(!txq))
 		return;
 
-- 
2.34.1

